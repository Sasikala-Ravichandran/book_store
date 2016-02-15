require 'rails_helper'

RSpec.describe PasswordResetsController, :type => :controller do
  
  let(:user) { Fabricate(:user, token: '1234', password: 'password') }

  describe "GET #new" do
    it "returns new template" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    context "no email address provided" do
      it "redirects to new template" do
        post :create, email: nil
        expect(response).to redirect_to new_password_reset_path
      end

      it "displays flash danger message" do
        post :create, email: nil
        expect(flash[:danger]).to eq("Email can't be blank")
      end

    end
  
    context "invalid email address provided" do

      it "redirects to new template" do
        post :create, email: "test@example.com"
        expect(response).to redirect_to new_password_reset_path
      end

      it "displays flash danger message" do
        post :create, email: "test@example.com"
        expect(flash[:danger]).to eq("Email is invalid")
      end
    end

    context "valid email address provided" do
      it "redirects to confirm password page" do
        post :create, email: user.email
        expect(response).to render_template :confirm_password_reset
      end

      it "delivers the mails" do
        post :create, email: user.email
        expect(ActionMailer::Base.deliveries.last.to).to eq([user.email])
      end

      it "displays flash message" do
        post :create, email: user.email
        expect(flash[:success]).to eq("Please check the mail to reset the password")
      end

    end
  end

  describe "GET #edit" do
    it "returns edit template" do
      get :edit, id: user.token 
      expect(response).to have_http_status(:success)
    end

    it "redirects to expired token path" do
      get :edit, id: '123' 
      expect(response).to redirect_to expired_token_path
    end
  end

  describe "PUT #update" do
    context "valid password" do
      let(:john) { Fabricate(:user, token: '1234', password: 'password') }
      it "authenticates the user" do
        put :update, id: john.token, user: { password: 'password_1' }
        expect(john.reload.authenticate('password_1')).to be_truthy
      end

      it "display success flash message" do
        put :update, id: john.token, user: { password: 'password_1' }
        expect(flash[:success]).to eq("Password has been resetted")
      end

      it "redirects to login path" do
        put :update, id: john.token, user: { password: 'password_1' }
        expect(response).to redirect_to login_path
      end

      it "regenerates the token" do
        put :update, id: john.token, user: { password: 'password_1' }
        expect(john.reload.token).not_to eq('1234')
      end
    end

    context "invalid password" do
      let(:john) { Fabricate(:user, token: '1234', password: 'password') }
      it "redirects to expired path" do
        put :update, id: '123456', user: { password: 'password_1' }
        expect(response).to redirect_to expired_token_path
      end
    end

  end
end