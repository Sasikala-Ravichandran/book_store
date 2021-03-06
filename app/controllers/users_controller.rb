class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(token: params[:id])
  end

  def new
    @user = User.new
    @user.addresses.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User has been created"
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = "User has not been created"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :admin,
                                 addresses_attributes: [:address_line1, :address_line2,
                                  :city, :zipcode])
  end
end