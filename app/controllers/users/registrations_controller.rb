class Users::RegistrationsController < Devise::RegistrationsController
  # Upload photo to Cloudinary after successful sign up
  def create
    # Extract photo before Devise tries to assign it to the model
    uploaded_photo = params[:user].delete(:photo)

    # Read tempfile into memory before super (tempfile may close after)
    if uploaded_photo.present?
      @photo_data = uploaded_photo.read
      @photo_content_type = uploaded_photo.content_type
    end

    super do |user|
      if user.persisted? && @photo_data.present?
        # Upload raw data to Cloudinary using a StringIO
        file = StringIO.new(@photo_data)
        result = ::Cloudinary::Uploader.upload(file,
          folder: "know-how-now/avatars",
          public_id: "user_#{user.id}",
          overwrite: true,
          resource_type: "image",
          transformation: { width: 300, height: 300, crop: :fill, gravity: :face }
        )
        user.update_column(:picture, result["secure_url"])
      end
    end
  end
end
