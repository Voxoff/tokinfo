class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include PgSearch
  multisearchable against: [:first_name, :last_name, :email, :photo, :description]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :followings
  has_many :businesses
  has_many :tokens, through: :followings
  mount_uploader :photo, PhotoUploader
end
