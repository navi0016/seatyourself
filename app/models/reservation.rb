class Reservation < ApplicationRecord
  validates :party_size, :reservation_time, presence: true

  belongs_to :user
  belongs_to :restaurant

  # validation method
  def available_times(datetime)

    # self.restaurant.reservation_time.sum(datetime)
  end


end
