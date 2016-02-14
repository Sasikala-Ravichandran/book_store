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
    expect(current_path).to eq(cart_path(cart))
  end

end