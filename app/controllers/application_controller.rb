class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    #complete this method
    @current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

  def is_user_logged_in?
	#complete this method
    if current_user != nil then true else redirect_to root_path end 
  end
end
