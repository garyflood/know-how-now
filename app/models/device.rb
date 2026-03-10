class Device < ApplicationRecord
  belongs_to :category
  has_one :video, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :bookmarks, source: :user

  validates :name, presence: true
  validates :text_instructions, presence: true
  validates :views, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
