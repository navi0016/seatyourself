class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def convert_time_hours(time)
    time.strftime("%I:%M%p")
  end
  helper_method :convert_time_hours

end
