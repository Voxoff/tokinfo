class Token < ApplicationRecord
  belongs_to :business
  has_many :followings
  mount_uploader :photo, PhotoUploader
end
