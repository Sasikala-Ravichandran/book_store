require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  
  let!(:user) { Fabricate(:user) }

  describe "GET #new" do
    it "returns the success status" do
      get :new
      expect(response).to have_http_status(:success)       
    end
  end

  describe "POST #create" do
   
    context "successful login" do
      before do
        post :create, { :session => { email: user.email, password: user.password } }
      end

      it "creates a session record for valid input" do
        expect(session[:user_id]).to eq(user.id)
      end

      it "displays success flash message" do
        flash[:success] = "Successfully logged in"
      end

      it "redirects to show template of user" do
        expect(response).to redirect_to user_path(user)
      end

    end

    context "unsuccessful login" do
      before do
        post :create, { :session => { email: " ", password: " "} }
      end
      it "displays danger flash message" do
        expect(flash[:danger]).to eq("Invalid login information")
      end
    end

  end

  describe "DELETE #destroy" do
    before do
      delete :destroy
    end

    it "deletes the session" do
      require 'pry';binding.pry
      expect(session[:user_id]).to be_nil
    end

    it "displays logout flash message" do
      expect(flash[:success]).to eq("Successfully Logged out")
    end

    it "redirects root_path" do
      expect(response).to redirect_to root_path
    end
    
  end
end