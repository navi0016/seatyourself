class ReservationsController < ApplicationController

  def index
    # TODO: Find out why some bookings fail to save (eg. transaction is rolled back).
    # TODO: Ensure that user is directed away from index view if essential params are missing.
    @year = params[:reservation]["reservation_time(1i)"].to_i
    @month = params[:reservation]["reservation_time(2i)"].to_i
    @day = params[:reservation]["reservation_time(3i)"].to_i

    if @year ==0 || @month==0 || @day==0
      redirect_to root_path
    end
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new
    @selected_time=DateTime.new(params[:reservation]["reservation_time(1i)"].to_i,params[:reservation]["reservation_time(2i)"].to_i,params[:reservation]["reservation_time(3i)"].to_i, params[:reservation]["reservation_time(4i)"].to_i)



  end


  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new

    @reservation.reservation_time = params["reservation"]["reservation_time"]
    @reservation.party_size = params["reservation"]["party_size"]
    @reservation.user_id = session[:user_id]

    if current_user == nil
      flash[:notice] = "Please Log in first to make a Booking!"
      redirect_to root_path
    else
      # debugger
      # debugger
      @reservation.save!
      flash[:notice] = "You're reservation has been book!"
      redirect_to restaurant_reservation_path @restaurant,@reservation
    end

  end

  def render_capacity_error
  end

  def show
  end

  private

  def load_all_reservation
    @reservation
  end

end
