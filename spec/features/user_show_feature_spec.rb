require 'rails_helper'

RSpec.feature "showing user profile" do
  
  let!(:user) { Fabricate(:user, first_name: "John", last_name: "Doe", 
                                email: "j.d@email.com", password: "password") }
  scenario "visiting user profile" do
    visit root_path
    click_link 'Users'
    #print page.html
    click_link user.full_name
    within("h2") do
      expect(page).to have_content('John Doe')
    end
    within("h6") do
      expect(page).to have_content('j.d@email.com')
    end

  end

end