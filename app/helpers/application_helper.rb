module ApplicationHelper

  def require_login
    unless current_user
      flash[:danger] = "Please login"
      intended_destination
      redirect_to login_path
    end
  end

  def require_admin
    unless current_user.admin
      flash[:danger] = "Your are not admin of the site"
      redirect_to root_path
    end
  end
 
  def intended_destination
    session[:destination] = request.fullpath
  end

  def set_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end
  end

end
