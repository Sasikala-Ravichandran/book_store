require 'rails_helper'

RSpec.feature "Resetting Password" do
  
  let!(:user) { Fabricate(:user, email: "johnd@example.com") }
  scenario "with valid email address" do
    visit root_path
    click_link "Login"
    click_link "Forgot your password"

    fill_in "Email Address", with: user.email
    click_button "Reset Password"

    expect(page).to have_content("An email with instructions to reset your password has been sent to you.")

  end

  scenario "with invalid email address" do
    visit root_path
    click_link "Login"
    click_link "Forgot your password"

    fill_in "Email Address", with: "maxd@example.com"
    click_button "Reset Password"

    expect(page).to have_content("Email is invalid")
  end

  scenario "with no email address" do
    visit root_path
    click_link "Login"
    click_link "Forgot your password"

    fill_in "Email Address", with: " "
    click_button "Reset Password"

    expect(page).to have_content("Email can't be blank")
  end
end