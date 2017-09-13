class Restaurant < ApplicationRecord
  has_many :restaurants
  has_many :users, through: :reservations
end
