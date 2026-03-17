class DevicesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @device = Device.find(params[:id])
    @device.increment!(:views)
    # Fallback for in-app back link when browser history is empty (link uses history.back() when history.length > 1)
  end

  def manual
    @device = Device.find(params[:id])
    @bookmark = user_signed_in? ? current_user.bookmarks.find_by(device: @device) : nil
  end

  def related
    @device = Device.find(params[:id])
  end

  def create
    uploaded_image = params[:device_image].presence || params[:device_camera_image].presence
    input_name = params.dig(:device, :name)

    if uploaded_image.blank? && input_name.blank?
      flash.now[:alert] = "Please enter a device name or upload an image."
      @device = Device.new
      render "pages/home", status: :unprocessable_entity and return
    end

    if uploaded_image.present?
      @device, status = Device.find_or_create_from_image(uploaded_image)
    else
      @device, status = Device.find_or_create_from_name(input_name)
    end

    flash[:notice] = status == :existing ? "We already have instructions for #{@device.name}!" : "Device was successfully added with instructions!"
    redirect_to device_path(@device, **(params[:from].present? ? { from: params[:from] } : {}))
  rescue StandardError => e
    @not_a_device = e.is_a?(Device::NotADeviceError)
    flash.now[:alert] = "Unable to generate instructions: #{e.message}"
    render "pages/home", status: :unprocessable_entity
  end

  def update
    @device = Device.find(params[:id])
    uploaded_image = params[:device_image].presence || params[:device_camera_image].presence

    if uploaded_image.blank?
      flash[:alert] = "Please upload an image to update the device."
      redirect_to device_path(@device) and return
    end

    cloudinary_url = Device.upload_image_to_cloudinary(uploaded_image)
    if cloudinary_url.nil?
      flash[:alert] = "Image upload failed. Please try again."
      redirect_to device_path(@device) and return
    end

    @device.append_image(cloudinary_url)
    flash[:notice] = "Image added to #{@device.name}!"
    redirect_to device_path(@device)
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Device not found."
    redirect_to root_path
  end

  private

  def from_explore?
    return false if request.referer.blank?
    uri = URI.parse(request.referer)
    uri.path.start_with?("/explore")
  rescue URI::InvalidURIError
    false
  end

  def device_params
    params.require(:device).permit(:name)
  end
end
