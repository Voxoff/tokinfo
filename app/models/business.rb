class Business < ApplicationRecord
  belongs_to :user
  has_many :tokens
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :url, presence: true
end
