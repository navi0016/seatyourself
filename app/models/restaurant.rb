class Restaurant < ApplicationRecord
  validates :name, :email, :location, :type_of_food, :start_time, :end_time, :capacity, presence: true

  has_many :reservations
  has_many :users, through: :reservations

  # find method
  def find_available_seats(datetime)
    # self.reservations.sum(:party_size)
    # will give you available seats at the time of the requested reservation
    self.capacity - self.reservations.where(reservation_time: datetime).sum(:party_size)
  end



end
