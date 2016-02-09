def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def set_admin_user(admin=nil)
  session[:user_id] = (admin || Fabricate(:admin)).id
end

def clear_current_user
  session.delete(:user_id)
end

def current_user
  User.find(session[:user_id])
end