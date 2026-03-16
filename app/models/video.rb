class Video < ApplicationRecord
  belongs_to :user
  belongs_to :device

  before_validation :set_default_views

  validates :summary, presence: true
  validates :video_link, presence: true
  validates :views, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :device_id, uniqueness: { message: "already has a video" }

  def self.upload_video_to_cloudinary(uploaded_video)
    source = uploaded_video.is_a?(String) ? uploaded_video : StringIO.new(uploaded_video.read)
    result = ::Cloudinary::Uploader.upload(source, folder: "know-how-now/videos", resource_type: "video")
    result["secure_url"]
  rescue StandardError => e
    Rails.logger.error "Cloudinary video upload failed: #{e.message}"
    nil
  end

  private

  def set_default_views
    self.views ||= 0
  end
end
