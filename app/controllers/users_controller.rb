class UsersController < ApplicationController

def new
  @user= User.new
end

def create
  @user = User.new

    @user.email = params[:user][:email]
    @user.phone_number = params[:user][:phone_number]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

   if @user.save!
     redirect_to root_path
   else
     render :new
   end
end


end
