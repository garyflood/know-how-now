class Users::RegistrationsController < Devise::RegistrationsController
  def create
    # Extract photo before Devise tries to assign it (params keys are strings)
    uploaded_photo = params[:user].delete("photo")

    # Read file into memory now — tempfile closes after request processing
    @photo_data = uploaded_photo.read if uploaded_photo.present?

    super do |user|
      upload_photo_to_cloudinary(user) if user.persisted? && @photo_data.present?
    end
  end

  private

  def upload_photo_to_cloudinary(user)
    result = ::Cloudinary::Uploader.upload(
      StringIO.new(@photo_data),
      folder: "know-how-now/avatars",
      public_id: "user_#{user.id}",
      overwrite: true,
      resource_type: "image"
    )
    user.update_column(:picture, result["secure_url"])
  rescue StandardError => e
    Rails.logger.error "Cloudinary upload failed: #{e.message}"
  end
end
