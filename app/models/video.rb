class Video < ApplicationRecord
  belongs_to :user
  belongs_to :device

  validates :summary, presence: true
  validates :tags, presence: true
  validates :script, presence: true
  validates :views, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
