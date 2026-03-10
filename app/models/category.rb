class Category < ApplicationRecord
  has_many :devices, dependent: :destroy

  validates :category_name, presence: true
end
