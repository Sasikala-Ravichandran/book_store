require 'rails_helper'
require 'support/macro'

RSpec.feature "Creating Orders" do
  
  let!(:book) { Fabricate(:book) }
  let!(:user) { Fabricate(:user) }

  before { sign_in_as user }
  scenario "create a valid book", js: true do
    visit root_path
    click_link "Catalogs", exact: false
    click_link book.title
    click_button "Add to Cart"
    click_button "checkout"

    fill_in "Credit Card Number", with: "4242424242424242"
    fill_in "Security Code", with: "123"
    select '10 - October', from: "date_month"
    select "2016", from: "date_year"
    click_button "Create Order"

    expect(page).to have_content("Order has been created")
  end

end