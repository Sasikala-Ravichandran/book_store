class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      OrderMailer.send_password_reset_link(@user).deliver_now
      render template: "password_resets/confirm_password_reset"
      flash[:success] = "Please check the mail to reset the password"
      false
    else
      flash[:danger] = params[:email].blank? ? "Email can't be blank" : "Email is invalid" 
      redirect_to new_password_reset_path
    end
  end

  def edit
    @user = User.find_by(token: params[:id])
    redirect_to expired_token_path unless @user
  end

  def update
    @user = User.find_by(token: params[:id])

    if @user
      @user.password = params[:user][:password]
      @user.token = SecureRandom.urlsafe_base64
      @user.save
      flash[:success] = "Password has been resetted"
      redirect_to login_path
    else
      redirect_to expired_token_path
    end
  end

end