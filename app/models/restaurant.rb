class Restaurant < ApplicationRecord
  has_many :restaurants
  has_many :restaurants, through: :reservations
end
