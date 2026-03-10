class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_devices, through: :bookmarks, source: :device
end
