class Token < ApplicationRecord
  belongs_to :business
  belongs_to :user, optional: true
  mount_uploader :photo, PhotoUploader
end
