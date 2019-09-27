class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  
  def login_user!(user)
      session[:session_token] = user.reset_session_token!
  end 

  def current_user 
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end 

  def logout_user! 
    current_user.reset_session_token! if !current_user.nil? 
    session[:session_token] = nil
  end 

  def signed_in? 
    if !current_user.nil? 
      redirect_to cats_url
    end 
  end 

end
