require 'rails_helper'
require 'support/macro'

RSpec.feature "showing user profile" do
  
  let!(:admin) { Fabricate(:admin, first_name: "John", last_name: "Doe", 
                                email: "j.d@email.com", password: "password", admin: true) }

  scenario "visiting user profile" do
    sign_in_as(admin)
    visit root_path
    click_link 'Users'
    #print page.html
    click_link admin.full_name
    within("h2") do
      expect(page).to have_content('John Doe')
    end
    within("h6") do
      expect(page).to have_content('j.d@email.com')
    end

  end

end