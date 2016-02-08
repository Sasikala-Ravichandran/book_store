require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #show" do
    let(:user) { Fabricate(:user) }
    it "responses with show template" do
      get :show, id: user.id
      #require 'pry';binding.pry
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "responses with new template" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "a successful create" do
      it "saves new user object and stores user id in session cookie" do
        post :create, user: Fabricate.attributes_for(:user)
        require 'pry';binding.pry
        expect(User.count).to eq(1)
        expect(session[:user_id]).to eq(User.last.id)
      end

      it "displays success flash message" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(flash[:success]).to eq("User has been created")
      end

      it "redirects to show template" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to user_path(User.last)
      end
    end

    context "an unsuccessful create" do
      it "does not save new user object" do
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)
        expect(User.count).to eq(0)
      end

      it "displays danger flash message" do
        post :create, user: Fabricate.attributes_for(:user, first_name: nil)
        expect(flash[:danger]).to eq("User has not been created")
      end
    end
  end
end