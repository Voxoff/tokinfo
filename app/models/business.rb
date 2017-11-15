class Business < ApplicationRecord
  belongs_to :user
  has_many :tokens

  validates :name, presence: true
  validates :url, presence: true
  validates :address, presence: true
  validates :email, presence: true
   mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
