require 'rails_helper'
require 'support/macro'

RSpec.feature "Hiding links" do
  
  let(:user) { Fabricate(:user) }

  scenario "hiding links for user" do
    sign_in_as(user)
    visit root_path
    expect(page).not_to have_link("Authors")
    expect(page).not_to have_link("Books")
    expect(page).not_to have_link("Users")
  end

end