class SessionsController < ApplicationController 
  before_action :signed_in?, only: [:new, :create]

  def new 
    render :new
  end 

  def create 
    user = User.find_by_credentials(
           params[:user][:user_name], 
           params[:user][:password]) 

    if !user.nil?
      login_user!(user)
      redirect_to cats_url
    else
      render json: "Wrong Credentials!"
    end

  end 

  def destroy 
     logout_user!
     redirect_to cats_url
  end 
  

 
end 