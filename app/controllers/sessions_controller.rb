class SessionsController < ApplicationController
  def new

  end

  def create
    # find user by email
    u = User.find_by(email: params[:session][:email])
    # authenticate that the user email and password match. if it matches then sign the user in and add a 'wristband' on that user so they stay logged in. otherwise render the log in page again
    if u && u.authenticate(params[:session][:password])
      session[:user_id] = u.id
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
