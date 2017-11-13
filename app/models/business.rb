class Business < ApplicationRecord
  belongs_to :user
  has_many :tokens
  validates :name, presence: true
  validates :url, presence: true
  validates :address, presence: true
  validates :email, presence: true
end
