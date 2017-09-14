class Restaurant < ApplicationRecord
  validates :name, :email, :location, :type_of_food, :start_time, :end_time, :capacity, presence: true

  has_many :reservations
  has_many :users, through: :reservations

end
