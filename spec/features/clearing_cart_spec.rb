require 'rails_helper'
require 'support/macro'

RSpec.feature "Clearing Cart" do

  let!(:therailsway) { Fabricate(:book, title: "The Rails 4 way") }
  scenario "clears the cart items" do
    visit root_path
    expect(page).to have_link(therailsway.title)
    click_link therailsway.title
    click_button "Add to Cart"
    expect(page).to have_button("Clear Cart")
    click_button "Clear Cart"
    expect(current_path).to eq(catalogs_path)
  end
end