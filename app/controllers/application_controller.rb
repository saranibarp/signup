class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def signed_in?
    current_user.present?
  end

  def current_user
    if session[:user_id]
      user = User.find(session[:user_id])
    else
      nil
    end
  end
end
