require 'rails_helper.rb'

RSpec.describe AuthorsController, :type => :controller do

  describe "GET #index" do

    it "returns a successful http request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe "Get #show" do

    
    it "returns a successful show template" do
      author =  Fabricate(:author)
      get :show, id: author.id
      #require 'pry';binding.pry
      expect(response).to have_http_status(:success)
    end

  end
  
  describe "GET #new" do

    it "returns a new" do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

  describe "Post #create" do

    context "a successful create" do

      it "saves new author object" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(Author.count).to eq(1)
      end

      it "redirects to show page" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(response).to redirect_to author_path(Author.last)
      end

      it "displays success flash message" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(flash[:success]).to eq("Author has been created")
      end
    end
  
    context "an unsuccessful path" do
   
      it "does not save author object with invalid input" do
        post :create, author: Fabricate.attributes_for(:author, first_name: " ")
        expect(Author.count).to eq(0)
      end

      it "displays danger flash message" do
        post :create, author: Fabricate.attributes_for(:author, first_name: " ")
        expect(flash[:danger]).to eq("Author has not been created")
      end
  
    end
  end

  describe "GET #edit" do
    
    let(:john) { Fabricate(:author) }
    it "returns successful http response" do
      get :edit, id: john.id
      #require 'pry'; binding.pry
      expect(response).to have_http_status(:success)
    end
  
  end

  describe "PUT #update" do

    context "A successful update" do

      let(:john) { Fabricate(:author, first_name: "John", last_name: "Walcher") }
      it "updates the existing author object" do

        put :update, author: Fabricate.attributes_for(:author, first_name: "Mike"), id: john.id
        expect(Author.last.first_name).to eq("Mike") 
        expect(Author.last.first_name).not_to eq("John")
        expect(Author.last.last_name).not_to eq("Walcher")
      end

      it "displays success flash message" do
        put :update, author: Fabricate.attributes_for(:author), id:john.id
        expect(flash[:success]).to eq("Author has been updated")
      end

      it "redirects to show action" do
        put :update, author: Fabricate.attributes_for(:author, first_name: "Mike"), id: john.id
        #require 'pry'; binding.pry
        expect(response).to redirect_to author_path(Author.last)
      end
    end

    context "An unsuccessful update" do

      let(:john) { Fabricate(:author, first_name: "John", last_name: "Doe") }
      it "does not update the author object with invalid input" do
        put :update, author: Fabricate.attributes_for(:author, first_name: " "), id: john.id
        #require 'pry'; binding.pry;
        expect(Author.last.first_name).to eq("John")
      end

      it "displays danger flash message" do
        put :update, author: Fabricate.attributes_for(:author, first_name: " "), id: john.id
        expect(flash[:danger]).to eq("Author has not been updated")
      end

    end

  end

  describe "DELETE #destroy" do
    
    let(:john) { Fabricate(:author) }
    it "deletes the author" do
      delete :destroy, id: john.id
      expect(Author.count).to eq(0)
    end

    it "displays flash message" do
      delete :destroy, id: john.id
      expect(flash[:success]).to eq("Author has been destroyed")
    end

    it "redirects to index page" do
      delete :destroy, id: john.id
      expect(response).to redirect_to authors_path
    end
  end
end