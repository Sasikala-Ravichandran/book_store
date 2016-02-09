module ApplicationHelper

  def require_login
    unless current_user
      flash[:danger] = "Please sign-in"
      redirect_to login_path
    end
  end

  def require_admin
    unless current_user.admin
      flash[:danger] = "Your are not admin of the site"
      redirect_to root_path
    end
  end

end
