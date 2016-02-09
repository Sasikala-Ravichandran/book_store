require 'rails_helper'
require 'support/macro'
RSpec.feature "Creating Authors" do
  
  let(:admin) { Fabricate(:admin) }
  scenario "with valid inputs succeeds" do
    
    sign_in_as(admin)

    click_link "Authors"
    click_link "Add new author"
    
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"

    click_button "Create Author"

    expect(page).to have_content("Author has been created")
  end

  scenario "with invalid inputs fails" do
    
    sign_in_as (admin)
    
    click_link "Authors"
    click_link "Add new author"
    
    fill_in "First name", with: ""
    fill_in "Last name", with: ""

    click_button "Create Author"

    expect(page).to have_content("Author has not been created")
  end

end