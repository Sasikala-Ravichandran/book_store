require 'rails_helper'
require 'support/macro'

RSpec.feature "user login" do
  
  let!(:user) { Fabricate(:user) }

  scenario "valid login" do
    sign_in_as user
    click_link "Logout"
    #require 'pry';binding.pry
    expect(page).to have_content("Successfully Logged out")
    expect(current_path).to eq(root_path)
    expect(page).not_to have_link("Logout")
  end

  scenario "invalid login" do
    visit root_path
    click_link "Login"
    #print page.html
    expect(current_path).to eq(login_path)
    fill_in "Email", with: " "
    fill_in "Password", with: user.password
    click_button "Sign In"
    expect(page).to have_content("Invalid login information")
    expect(current_path).to eq(login_path)
    visit root_path
    expect(page).not_to have_content("Invalid login information")
  end

end