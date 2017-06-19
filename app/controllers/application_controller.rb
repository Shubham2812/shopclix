class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  helper_method :user_signed_in?, :current_user
  def user_signed_in?
  	if session[:user_id]
  		return true
  	else
  		return false
  	end
  end

  def current_user
  	return User.find(session[:user_id])
  end
end
