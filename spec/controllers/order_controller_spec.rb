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
end