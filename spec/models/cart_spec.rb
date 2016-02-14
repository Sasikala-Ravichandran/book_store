require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_many(:cart_items) }
  it { should have_many(:books).through(:cart_items) }

  describe "#total_sale" do
    it "returns the total cost of the cart" do
      cart_item1 = Fabricate(:cart_item, price: 10, quantity: 3)
      cart_item2 = Fabricate(:cart_item, price: 15, quantity: 2)
      cart = Fabricate(:cart)
      cart.cart_items << cart_item1
      cart.cart_items << cart_item2
      expect(cart.total_sale).to eq(60)
    end
  end

end
