class Reservation < ApplicationRecord
  validates :party_size, :reservation_time, presence: true

  belongs_to :user
  belongs_to :restaurant
end
