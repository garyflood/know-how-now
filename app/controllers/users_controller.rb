class UsersController < ApplicationController
  before_action :authenticate_user!

  # Profile page for the currently logged-in user
  def show
    @user = current_user
  end

  # My Uploads — full list of current user's videos, sortable
  def uploads
    @user = current_user
    @sort = params[:sort] == "most_viewed" ? "most_viewed" : "latest"
    @videos = @sort == "most_viewed" ? @user.videos.order(views: :desc) : @user.videos.order(created_at: :desc)
  end

  # Edit profile form
  def edit
    @user = current_user
  end

  # Update profile — handles text fields and optional photo upload
  def update
    @user = current_user
    uploaded_photo = params[:user].delete("photo")

    if @user.update(user_params)
      # Upload new photo to Cloudinary if one was provided
      upload_photo_to_cloudinary(uploaded_photo) if uploaded_photo.present?
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :username, :email)
  end

  def upload_photo_to_cloudinary(uploaded_photo)
    result = ::Cloudinary::Uploader.upload(
      StringIO.new(uploaded_photo.read),
      folder: "know-how-now/avatars",
      public_id: "user_#{@user.id}",
      overwrite: true,
      resource_type: "image"
    )
    @user.update_column(:picture, result["secure_url"])
  rescue StandardError => e
    Rails.logger.error "Cloudinary upload failed: #{e.message}"
  end
end
