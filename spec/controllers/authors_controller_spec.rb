require 'rails_helper.rb'

RSpec.describe AuthorsController, :type => :controller do

  describe "GET #index" do
    it "returns a successful http request status code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "Get #show" do
    let!(:author) { Fabricate(:author) }
    it "returns a successful show template" do
      get :show, id: author.id
      #require 'pry';binding.pry
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #new" do
    it "returns a new" do

    end
  end

end