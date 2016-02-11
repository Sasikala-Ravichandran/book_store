require 'rails_helper'

RSpec.describe CartsController, :type => :controller do
  
  let(:cart) { Fabricate(:cart) }

  describe "GET #show" do
    it "returns show template" do
      get :show, id: cart.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "sets cart session to nil" do
      delete :destroy, id: cart.id
      expect(session[:cart_id]).to be_nil
    end

    it "redirects to catalogs index template" do
      delete :destroy, id: cart.id
      expect(response).to redirect_to catalogs_path
    end

  end

end