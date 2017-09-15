class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def convert_time_hours(time)
    time.strftime("%I:%M%p")
  end
  helper_method :convert_time_hours

  # this def is so we can display user email versus displaying user id (more personal). put this definiton in the application controller so it's available on all pages since all controllers inherit from application controller.
  def current_user
    session[:user_id] && User.find(session[:user_id])
  end
  helper_method :current_user

  def ensure_logged_in
    unless current_user
    flash[:alert] = "Please log in"
    redirect_to new_session_url
    end
  end


end
