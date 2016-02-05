require 'rails_helper'

RSpec.feature "creating user" do

    scenario "with valid credentials" do
      
      visit root_path
      click_link 'Sign Up'
      fill_in "First name", with: "John"
      fill_in "Last name", with: "Doe"
      fill_in "Email", with: "John@example.com"
      fill_in "Password", with: "password" 
      fill_in "Password confirmation", with: 'password'
      click_button 'Create User'

      expect(page).to have_content("User has been created")
    end

    scenario "with invalid credentials" do

      visit root_path
      click_link 'Sign Up'
      fill_in "First name", with: " "
      fill_in "Last name", with: " "
      fill_in "Email", with: "John@example.com"
      fill_in "Password", with: "password" 
      fill_in "Password confirmation", with: 'password'
      click_button 'Create User'

      expect(page).to have_content("User has not been created")
      
    end
end