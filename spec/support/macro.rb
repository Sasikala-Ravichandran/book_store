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

def sign_in_as(user)
  visit root_path
  click_link "Login"
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
  expect(page).to have_content("Successfully logged in")
  expect(current_path).to eq(user_path(user))
end

