class Reservation < ApplicationRecord
  validates :party_size, :reservation_time, presence: true
  validate :can_be_made
  belongs_to :user
  belongs_to :restaurant

  # validation method
  def can_be_made
    if party_size  > restaurant.capacity
      errors.add(:base, "Party size is too big, reservation can't be made!")
    end
  end


end
