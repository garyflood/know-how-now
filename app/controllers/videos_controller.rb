class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  before_action :set_user, only: [:new, :create]
  before_action :authorize_user!, only: [:new, :create]

  def new
    @video = Video.new
  end

  def create
    device, _status = Device.find_or_create_from_name(params[:device_name])

    Array(params[:device_images]).each do |image|
      url = Device.upload_image_to_cloudinary(image)
      device.append_image(url) if url
    end

    if device.video.present?
      @video = Video.new
      flash.now[:alert] = "#{device.name} already has a video."
      return render :new, status: :unprocessable_entity
    end

    cloudinary_url = Video.upload_video_to_cloudinary(params[:video_file])
    raise "Video upload failed. Please try again." if cloudinary_url.nil?

    @video = @user.videos.build(video_params.merge(device: device, video_link: cloudinary_url))

    if @video.save
      redirect_to device_video_path(device, @video), notice: "Video was successfully added!"
    else
      render :new, status: :unprocessable_entity
    end
  rescue StandardError => e
    flash.now[:alert] = e.message
    render :new, status: :unprocessable_entity
  end

  def show
    @device = Device.find(params[:device_id])
    @video = @device.video
    @video.increment!(:views)
    @bookmark = user_signed_in? ? current_user.bookmarks.find_by(device: @device) : nil
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def authorize_user!
    unless current_user == @user
      redirect_to profile_path, alert: "You are not authorized to do that."
    end
  end

  def video_params
    params.require(:video).permit(:summary)
  end
end
