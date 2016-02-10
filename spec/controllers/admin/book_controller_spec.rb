require 'rails_helper'
require 'support/macro'
require 'support/shared_examples'

RSpec.describe Admin::BooksController, :type => :controller do

  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  before{ set_admin_user admin }
  describe "GET #index" do

    context "access as a guest" do
      it_behaves_like "requires log-in" do
        let(:action) { get :index }
      end
    end

    context "access as a non-admin user" do
      it_behaves_like "requires admin" do
        let(:action) { get :index }
      end
    end

    context "access as admin user" do
      it "responses with index template" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #show" do
    
    let(:book) { Fabricate(:book) }
    
    context "access as a guest" do
      it_behaves_like "requires log-in" do
        let(:action) { get :show, id: book.id }
      end
    end

    context "access as a non-admin user" do
      it_behaves_like "requires admin" do
        let(:action) { get :show, id: book.id }
      end
    end

    context "access as admin user" do
      it "responses with show template" do
        book = Fabricate(:book)
        get :show, id: book.id
        expect(response).to have_http_status(:success)
      end
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
      before do
        post :create, book: Fabricate.attributes_for(:book)
      end
      
      it "saves the book object" do
        #require 'pry';binding.pry
        expect(Book.count).to eq(1)
      end

      it "displays success flash messages" do
        expect(flash[:success]).to eq("Book has been created")
      end

      it "redirects to show template" do
        expect(response).to redirect_to admin_book_path(Book.last)
      end

    end

    context "an unsuccessful create" do
      before do
        post :create, book: Fabricate.attributes_for(:book, title: "")
      end

      it "does not save the object" do
        expect(Book.count).to eq(0)
      end

      it "displays danger flash message" do
        expect(flash[:danger]).to eq("Book has not been created")
      end
    end

  end

  describe "GET #edit" do
    let(:book) { Fabricate(:book) }  
    it "responses with edit template" do
      get :edit, id: book
      expect(response).to have_http_status(:success)
    end

  end

  describe "PUT #update" do
   let(:book) { Fabricate(:book, title: "Awesome Book") }

   context "a success update" do
    
    before do
      put :update, book: Fabricate.attributes_for(:book, title: "A Frog"), id: book
    end

    it "updates book object" do
      #require 'pry'; binding.pry
      expect(Book.last.title).to eq("A Frog")
    end

    it "displays success flash message" do
      expect(flash[:success]).to eq("Book has been updated")
    end

    it "redirects to show template" do
      expect(response).to redirect_to admin_book_path(Book.last)
    end

   end

   context "an unsuccessful update" do
    
     before do
      put :update, book: Fabricate.attributes_for(:book, title: " "), id: book
    end
    it "does not update" do
      #require 'pry';binding.pry
      expect(Book.last.title).to eq("Awesome Book")
    end

    it "displays danger flash message" do
      expect(flash[:danger]).to eq("Book has not been updated")
    end

   end
  
  end

  describe "DELETE #destroy" do
    let(:book) { Fabricate(:book) }
    before do
      delete :destroy, id: book
    end

    it "deletes book object" do
      expect(Book.count).to eq(0)
    end

    it "displays flash message" do
      expect(flash[:success]).to eq("Book has been destroyed")
    end

    it "redirects to index page of books" do
      expect(response).to redirect_to admin_books_path
    end
  end

end