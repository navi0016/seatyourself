class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = @restaurant.reservations.new
  end

  def new
  end

  def create
  end

  def update
    @restaurant.name = params[:restaurant][:name]
    @restaurant.email = params[:restaurant][:email]
    @reservation.location = params[:restaurant][:location]
    @restaurant.start_time = params[:restaurant][:start_time]
    @restaurant.end_time = params[:restaurant][:end_time]
    @restaurant.capacity = params[:restaurant][:capacity]

    if @restaurant.save
      redirect_to "/restaurant/#{@restaurant.id}"
    else
      render :edit
    end
  end

  def destroy
  @restaurant = Restaurant.find(params[:id])
  @restaurant.destroy
  redirect_to root_path
  end

end
