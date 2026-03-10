class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :videos, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_devices, through: :bookmarks, source: :device
end
