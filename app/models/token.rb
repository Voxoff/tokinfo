class Token < ApplicationRecord
  belongs_to :business
  has_many :followings
  has_many :users, through: :followings
  has_many :prices
  mount_uploader :photo, PhotoUploader
end
