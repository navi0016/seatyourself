class RestaurantsController < ApplicationController
   before_action :ensure_logged_in, except: [:show, :index]
   before_action :load_restaurant, only: [:create, :edit, :update, :destroy]
   before_action :ensure_user_owns_restaurant, only: [:create, :edit, :update, :destroy]


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
    @restaurant.name = params[:restaurant][:name]
    @restaurant.email = params[:restaurant][:email]
    @reservation.location = params[:restaurant][:location]
    @restaurant.start_time = params[:restaurant][:start_time]
    @restaurant.end_time = params[:restaurant][:end_time]
    @restaurant.capacity = params[:restaurant][:capacity]
    @restaurant.user_id = current_user[:id]

    if @restaurant.save
    redirect_to root_path
  else
    render :new
  end

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
  @restaurant.destroy
  redirect_to root_path
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def ensure_user_owns_restaurant
  unless current_user == @restaurant.user
    flash[:alert] = "You are not authorized to view this page!"
    redirect_to new_session_url
  end
  end

end
