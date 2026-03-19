class Device < ApplicationRecord
  class NotADeviceError < StandardError; end

  belongs_to :category
  has_one :video, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :bookmarks, source: :user

  validates :name, presence: true, uniqueness: true
  validates :text_instructions, presence: true
  validates :views, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.find_or_create_from_name(name)
    existing = find_by(name: name)
    return [existing, :existing] if existing

    category_names = Category.pluck(:category_name).join("\n")
    response = JSON.parse(RubyLLM.chat.ask(build_text_prompt(name, category_names)).content)

    raise NotADeviceError, "\"#{response['exact_model'] || name}\" does not appear to be a device." unless response["is_device"]
    raise "Could not identify an exact model." if response["exact_model"].blank?

    existing = find_by(name: response["exact_model"])
    return [existing, :existing] if existing

    device = build_from_ai_response(response)
    device.save!
    [device, :created]
  end

  def self.find_or_create_from_image(uploaded_image)
    cloudinary_url = upload_image_to_cloudinary(uploaded_image)
    raise "Image upload failed. Please try again." if cloudinary_url.nil?

    category_names = Category.pluck(:category_name).join("\n")
    response = JSON.parse(RubyLLM.chat.ask(build_image_prompt(category_names), with: cloudinary_url).content)

    raise NotADeviceError, "\"#{response['exact_model']}\" does not appear to be a device." unless response["is_device"]
    raise "Could not identify an exact model." if response["exact_model"].blank?

    existing = find_by(name: response["exact_model"])
    if existing
      existing.append_image(cloudinary_url)
      return [existing, :existing]
    end

    device = build_from_ai_response(response, cloudinary_url)
    device.save!
    [device, :created]
  end

  def self.upload_image_to_cloudinary(uploaded_image)
    source = uploaded_image.is_a?(String) ? uploaded_image : uploaded_image.tempfile.path
    result = ::Cloudinary::Uploader.upload(source, folder: "know-how-now/devices", resource_type: "image")
    result["secure_url"]
  rescue StandardError => e
    Rails.logger.error "Cloudinary device image upload failed: #{e.message}"
    nil
  end

  def append_image(cloudinary_url)
    return if cloudinary_url.blank?

    update_column(:images, (images + [cloudinary_url]).uniq)
  end

  private

  def self.build_from_ai_response(response, cloudinary_url = nil)
    device = new
    device.name = response["exact_model"]
    device.category = Category.find_by(category_name: response["category"]) ||
                      Category.find_by(category_name: "Personal Computers")
    device.text_instructions = response["instructions"]
    device.related_devices = Array(response["related_devices"])
    device.images = [cloudinary_url] if cloudinary_url.present?
    device
  end

  def self.build_text_prompt(name, category_names)
    <<~PROMPT
      A user has entered the following device name: "#{name}"

      Respond with a raw JSON object only — no markdown wrapper, no code fences around the JSON itself. With exactly these keys:
      - "is_device": true if this is a real device, false if it is not
      - "exact_model": the brand and model number only (e.g. "Toshiba EM131A5C-SS"), with no device type or description appended. If the input is a real device but no specific model is given, pick the most popular or well-known model for that brand/type as your best guess. Only null if not a device at all.
      - "category": which of the following categories best describes it (reply with ONLY the category name exactly as written): #{category_names}
      - "instructions": a comprehensive Markdown-formatted string (use ## headers, numbered lists, and bullet points) covering: (1) a brief device overview, (2) numbered setup steps, (3) key features and how to use them, (4) common operations with sub-steps, (5) troubleshooting tips for frequent issues. Be thorough and detailed.
      - "related_devices": an array of 15 specific brand and model numbers (e.g. "Toshiba EM131A5C-SS") that the user may have been referring to instead — other real models that match their input
    PROMPT
  end

  def self.build_image_prompt(category_names)
    <<~PROMPT
      Analyze the provided image and identify the device shown.

      Respond with a raw JSON object only — no markdown wrapper, no code fences around the JSON itself. With exactly these keys:
      - "is_device": true if this is a real device, false if it is not
      - "exact_model": the brand and model number only (e.g. "Toshiba EM131A5C-SS"), with no device type or description appended. If you can identify a real device but no specific model number is visible, pick the most popular or well-known model for that brand/type as your best guess. Only null if not a device at all.
      - "category": which of the following categories best describes it (reply with ONLY the category name exactly as written): #{category_names}
      - "instructions": a comprehensive Markdown-formatted string (use ## headers, numbered lists, and bullet points) covering: (1) a brief device overview, (2) numbered setup steps, (3) key features and how to use them, (4) common operations with sub-steps, (5) troubleshooting tips for frequent issues. Be thorough and detailed.
      - "related_devices": an array of 15 specific brand and model numbers (e.g. "Toshiba EM131A5C-SS") that are similar — other real models closely related to the identified device
    PROMPT
  end
end
