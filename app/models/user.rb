class User < ApplicationRecord
  validates :name, :email, :phone_number, presence: true

  has_many :reservations
  has_many :restaurants, through: :reservations

  has_secure_password
end
