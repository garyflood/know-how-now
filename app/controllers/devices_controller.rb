class DevicesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @device = Device.find(params[:id])
    @device.increment!(:views)
  end

  # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity
  def manual
    @device = Device.find(params[:id])
  end

  def script
    @device = Device.find(params[:id])
    @video = @device.video
  end

  # rubocop:disable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/AbcSize
  def create
    uploaded_image = params[:device_image].presence || params[:device_camera_image].presence
    input_name = params.dig(:device, :name)

    if uploaded_image.blank? && input_name.blank?
      flash.now[:alert] = "Please enter a device name or upload an image."
      @device = Device.new
      render "pages/home", status: :unprocessable_entity and return
    end

    category_names = Category.pluck(:category_name).join("\n")
    cloudinary_url = nil

    if uploaded_image.present?
      cloudinary_url = upload_device_image_to_cloudinary(uploaded_image)
      raise "Image upload failed. Please try again." if cloudinary_url.nil?

      prompt = build_image_prompt(category_names)
      response = JSON.parse(RubyLLM.chat.ask(prompt, with: cloudinary_url).content)
    else
      @device = Device.new(device_params)

      existing = Device.find_by(name: @device.name)
      if existing
        flash[:notice] = "We already have instructions for #{existing.name}!"
        redirect_to device_path(existing) and return
      end

      prompt = build_text_prompt(@device.name, category_names)
      response = JSON.parse(RubyLLM.chat.ask(prompt).content)
    end

    unless response["is_device"]
      @not_a_device = true
      raise "\"#{response['exact_model'] || input_name}\" does not appear to be a device."
    end
    raise "Could not identify an exact model." if response["exact_model"].blank?

    @device ||= Device.new
    @device.name = response["exact_model"]

    existing = Device.find_by(name: @device.name)
    if existing
      append_image_to_device(existing, cloudinary_url)
      flash[:notice] = "We already have instructions for #{existing.name}!"
      redirect_to device_path(existing) and return
    end

    @device.category = Category.find_by(category_name: response["category"]) ||
                       Category.find_by(category_name: "Personal Computers")
    @device.text_instructions = response["instructions"]
    @device.related_devices = Array(response["related_devices"])
    @device.images = [cloudinary_url] if cloudinary_url.present?

    if @device.save
      flash[:notice] = "Device was successfully added with instructions!"
      redirect_to device_path(@device)
    else
      flash.now[:alert] = "There was a problem adding the device."
      render "pages/home", status: :unprocessable_entity
    end
  rescue StandardError => e
    flash.now[:alert] = "Unable to generate instructions: #{e.message}"
    render "pages/home", status: :unprocessable_entity
  end
  # rubocop:enable Metrics/MethodLength, Metrics/PerceivedComplexity, Metrics/AbcSize

  def update
    @device = Device.find(params[:id])
    uploaded_image = params[:device_image].presence || params[:device_camera_image].presence

    if uploaded_image.blank?
      flash[:alert] = "Please upload an image to update the device."
      redirect_to device_path(@device) and return
    end

    cloudinary_url = upload_device_image_to_cloudinary(uploaded_image)
    if cloudinary_url.nil?
      flash[:alert] = "Image upload failed. Please try again."
      redirect_to device_path(@device) and return
    end

    append_image_to_device(@device, cloudinary_url)
    flash[:notice] = "Image added to #{@device.name}!"
    redirect_to device_path(@device)
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Device not found."
    redirect_to root_path
  end

  private

  def append_image_to_device(device, cloudinary_url)
    return if cloudinary_url.blank?

    device.update_column(:images, (device.images + [cloudinary_url]).uniq)
  end

  def device_params
    params.require(:device).permit(:name)
  end

  def build_text_prompt(name, category_names)
    <<~PROMPT
      A user has entered the following device name: "#{name}"

      Respond with a JSON object (no markdown, no code fences) with exactly these keys:
      - "is_device": true if this is a real device, false if it is not
      - "exact_model": the brand and model number only (e.g. "Toshiba EM131A5C-SS"), with no device type or description appended. If the input is a real device but no specific model is given, pick the most popular or well-known model for that brand/type as your best guess. Only null if not a device at all.
      - "category": which of the following categories best describes it (reply with ONLY the category name exactly as written): #{category_names}
      - "instructions": step by step instructions for how to use this device, written concisely in Markdown
      - "related_devices": an array of 15 specific brand and model numbers (e.g. "Toshiba EM131A5C-SS") that the user may have been referring to instead — other real models that match their input
    PROMPT
  end

  def build_image_prompt(category_names)
    <<~PROMPT
      Analyze the provided image and identify the device shown.

      Respond with a JSON object (no markdown, no code fences) with exactly these keys:
      - "is_device": true if this is a real device, false if it is not
      - "exact_model": the brand and model number only (e.g. "Toshiba EM131A5C-SS"), with no device type or description appended. If you can identify a real device but no specific model number is visible, pick the most popular or well-known model for that brand/type as your best guess. Only null if not a device at all.
      - "category": which of the following categories best describes it (reply with ONLY the category name exactly as written): #{category_names}
      - "instructions": step by step instructions for how to use this device, written concisely in Markdown
      - "related_devices": an array of 15 specific brand and model numbers (e.g. "Toshiba EM131A5C-SS") that are similar — other real models closely related to the identified device
    PROMPT
  end

  def upload_device_image_to_cloudinary(uploaded_image)
    # uploaded_image is either an ActionDispatch::Http::UploadedFile (file upload)
    # or a base64 data URI string (camera capture)
    source = uploaded_image.is_a?(String) ? uploaded_image : StringIO.new(uploaded_image.read)
    result = ::Cloudinary::Uploader.upload(
      source,
      folder: "know-how-now/devices",
      resource_type: "image"
    )
    result["secure_url"]
  rescue StandardError => e
    Rails.logger.error "Cloudinary device image upload failed: #{e.message}"
    nil
  end
end
