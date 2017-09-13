class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all

    render :index
  end

  def show
    @restaurant = Restaurant.find_by(params[:id])

    render :show
  end

end
