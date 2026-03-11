class Category < ApplicationRecord
  has_many :devices, dependent: :destroy

  validates :category_name, presence: true

  # Image filename stored in DB (e.g. "personal_computers.png"); assets live in app/assets/images/categories/
  def image_filename
    return nil if image.blank?
    "categories/#{image}"
  end
end
