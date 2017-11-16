class Token < ApplicationRecord
  include PgSearch
  multisearchable against: [:name, :photo, :description]
  belongs_to :business
  has_many :followings
  has_many :users, through: :followings
  mount_uploader :photo, PhotoUploader
end
