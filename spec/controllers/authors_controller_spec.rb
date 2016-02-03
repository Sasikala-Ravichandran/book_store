require 'rails_helper.rb'

RSpec.describe AuthorsController, :type => :controller do

  describe "GET #index" do

    it "returns a successful http request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe "Get #show" do

    let(:author) { Fabricate(:author) }
    it "returns a successful show template" do
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

      it "displays flash message" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(flash[:success]).to eq("Author has been created")
      end

    end
  end
end