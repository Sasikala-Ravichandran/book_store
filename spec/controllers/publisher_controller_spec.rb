require 'rails_helper'

RSpec.describe PublishersController, :type => :controller do
  
  describe "GET #index" do
    
    it "requests to index action" do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #show" do
    
    it "returns the show template" do
      publisher = Fabricate(:publisher)
      get :show, id: publisher.id
      expect(response).to have_http_status(:success)
    end
  
  end

  describe "GET #new" do
    
    it "requests to new action" do
      get :new
      expect(response).to have_http_status(:success)
    end
  
  end

  describe "POST #create" do
  
    context "a successful path" do
      
      it "saves new publisher object" do
        post :create, publisher: Fabricate.attributes_for(:publisher)
        expect(Publisher.count).to eq(1)
      end
      
      it "displays the success flash message" do
        post :create, publisher: Fabricate.attributes_for(:publisher)
        expect(flash[:success]).to eq("Publisher has been created")
      end
      
      it "redirects to show template" do
        post :create, publisher: Fabricate.attributes_for(:publisher)
        expect(response).to redirect_to Publisher.last
      end

    end

    context "An unsuccessful path" do

      it "does not save new publisher object" do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)
        expect(Publisher.count).to eq(0)
      end

      it "displays danger flash message" do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)
        expect(flash[:danger]).to eq("Publisher has not been created")
      end

    end
  end

  describe "GET #edit" do

    it "requests to edit action" do
      publisher = Fabricate(:publisher)
      get :edit, id: publisher.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "Put #update" do
    
    context "a successful update" do
      let(:wiley) { Fabricate(:publisher, name: "Wiley") } 
      it "updates the publisher" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: "John Wiley"), id: wiley.id
        #require 'pry'; binding.pry
        expect(Publisher.last.name).to eq("John Wiley")
      end

      it "displays success flash message" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: "John Wiley"), id: wiley.id
        expect(flash[:success]).to eq("Publisher has been updated")
      end

      it "redirects to show page" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: "John Wiley"), id: wiley.id
        expect(response).to redirect_to Author.last
      end

    end

    context "an unsuccessful update" do
      let(:wiley) { Fabricate(:publisher, name: "Wiley") } 
      it "does not update the publisher" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: " "), id: wiley.id
        #require 'pry'; binding.pry
        expect(Publisher.last.name).to eq("Wiley")
      end

      it "displays danger flash message" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: " "), id: wiley.id
        expect(flash[:danger]).to eq("Publisher has not been updated")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:publisher) { Fabricate(:publisher) }
    
    it "deletes a publisher object" do
      delete :destroy, id: publisher.id
      expect(Publisher.count).to eq(0)
    end

    it "displays flash message" do
      delete :destroy, id: publisher.id
      expect(flash[:success]).to eq("Publisher has been destroyed")
    end

    it "redirects to index page" do
      delete :destroy, id: publisher.id
      expect(response).to redirect_to publishers_path
    end

  end

end



