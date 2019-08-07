class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def redirect_if_logged_out
    if logged_in?
      redirect_to new_sessions_url
    end
  end 
 


  def logged_in?
    !@current_user.nil?
  end 

  def login(user)
    session[:session_token] = @user.session_token
  end 
end
