require 'rails_helper'
require 'support/macro'
RSpec.describe OrdersController, :type => :controller do

  let(:user) { Fabricate(:user) }
  before { set_current_user(user) }

  describe "GET #new" do 

    it "returns new template" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "redirects unauthorized user" do
      clear_current_user 
      get :new
      expect(response).to redirect_to(login_path)
    end
  end

  describe "POST #create" do

    let(:cart) { Fabricate(:cart) }
    let!(:book) { Fabricate(:book, price: 15 ) }
    let!(:cart_item) { Fabricate(:cart_item, cart: cart, book: book, quantity: 2) }
    let!(:cart_items) { cart.cart_items << cart_item }

    let(:token) do
      Stripe::Token.create(
        card: {
          :number => '4242424242424242',
          exp_month: 10,
          exp_year: 2018,
          cvc: 314
        }
        ).id
    end

    before { set_current_cart(cart) }
    it "saves the new object" do
      post :create, order: Fabricate.attributes_for(:order, user: user), stripeToken: token 
      expect(Order.count).to eq(1)
    end

    it "displays the successful flash message" do
      post :create, order: Fabricate.attributes_for(:order, user: user), stripeToken: token
      expect(flash[:success]).to eq("Order has been created")
    end

    it "sends email to user" do
      post :create, order: Fabricate.attributes_for(:order, user: user), stripeToken: token
      expect(ActionMailer::Base.deliveries.last.to).to eq([user.email])
    end
  end
end