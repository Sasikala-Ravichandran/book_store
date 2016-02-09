class SessionsController < ApplicationController

  def new
    #require 'pry'; binding.pry
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Successfully logged in"
      log_in user
      if session[:destination]
        redirect_to session[:destination] 
      else
        redirect_to user
      end
    else
      flash.now[:danger] = "Invalid login information"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = "Successfully Logged out"
    redirect_to root_path
  end

end