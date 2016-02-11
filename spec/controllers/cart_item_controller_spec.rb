require 'rails_helper'
require 'support/macro'

RSpec.describe CartItemsController, :type => :controller do
  
  let(:cart) { Fabricate(:cart) }
  let(:book) { Fabricate(:book) }

  before { set_current_cart cart }

  describe "POST #create" do
    it "saves a cartitem object in database" do
      post :create, cart_item: Fabricate.attributes_for(:cart_item, cart: cart,
                                                  book: book), book_id: book.id
      expect(CartItem.count).to eq(1)
    end

    it "redirects to cart" do
      post :create, cart_item: Fabricate.attributes_for(:cart_item, cart: cart,
                                                  book: book), book_id: book.id
      expect(response).to redirect_to cart_path(Cart.first.id)
    end

  end

end