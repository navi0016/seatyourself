class Restaurant < ApplicationRecord
  validates :name, :email, :location, :type_of_food, :start_time, :end_time, :capacity, presence: true

  has_many :reservations
  has_many :users, through: :reservations

  # def date_select
  #   datetime_select (@reservation, "reservation_time", default: 1.hour.from_now, ampm: true, start_hour: @restaurant.start_time.hour.to_i, end_hour: @restaurant.end_time.hour.to_i,datetime_separator: 'Time:',discard_minute: true,start_year: Date.today.year)
  # end

end
