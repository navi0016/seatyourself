
class ReservationsController < ApplicationController

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new

    @reservation.reservation_time = params[:reservation][:reservation_time]
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.restaurant_id = params[:restaurant_id]
    @reservation.user_id = params[:user_id]
  end
end
