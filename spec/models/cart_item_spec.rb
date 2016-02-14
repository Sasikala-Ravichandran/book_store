require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:book) }

  describe "#line_total" do
    it "returns the total cost of an item" do
      book = Fabricate(:book, price: 20)
      cart = Fabricate(:cart)
      cart_item = Fabricate(:cart_item, cart_id: cart.id, book_id: book.id,
                                        price: book.price, quantity: 3)
      expect(cart_item.line_total).to eq(60)
    end
  end

end
