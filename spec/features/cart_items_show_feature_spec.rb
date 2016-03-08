require 'rails_helper'

RSpec.feature "Showing cart items" do

  let!(:book) { Fabricate(:book) }
  let!(:cart_item) { Fabricate(:cart_item) }
  let!(:cart) { Fabricate(:cart) }
  scenario "Show carts" do
    visit root_path
    click_link "Catalogs"
    click_link book.title
    click_button "Add to Cart"
    require 'pry';binding.pry
    expect(current_path).to eq(catalog_path(book.id))
    #expect(page).to have_button("Checkout")
  end

end