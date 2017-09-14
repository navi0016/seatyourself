class ReservationsController < ApplicationController


  def index
    @restaurant = Restaurant.find(params[:restaurant_id])

    puts params[:reservation][:reservation_time]
    # @reservation.party_size = params[:reservation][:party_size]
    # @reservation.restaurant_id = params[:restaurant_id]
    # @reservation.user_id = params[:user_id]
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new

    @reservation.reservation_time = params[:reservation][:reservation_time]
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.restaurant_id = params[:restaurant_id]
    @reservation.user_id = params[:user_id]

    if @reservation.save
      flash[:notice] = "You're reservation has been book!"
    else
      render :index
    end

  end

end
