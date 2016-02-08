require 'rails_helper'

RSpec.feature "user login" do
  
  let!(:user) { Fabricate(:user) }

  scenario "valid login" do
    visit root_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content("Successfully logged in")
    expect(current_path).to eq(user_path(user))
    click_link "Logout"
    #require 'pry';binding.pry
    expect(page).to have_content("Successfully Logged out")
    expect(current_path).to eq(root_path)
  end

  scenario "invalid login" do
    visit root_path
    click_link "Login"
    #print page.html
    fill_in "Email", with: " "
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content("Invalid login information")
    visit root_path
    expect(page).not_to have_content("Invalid login information")
  end

end