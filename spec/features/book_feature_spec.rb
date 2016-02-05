require 'rails_helper'

RSpec.feature "Creating Books" do
  
  let!(:peachpit) { Fabricate(:publisher, name: 'Peachpit Press')}
  let!(:author1) { Fabricate(:author) }
  let!(:author2) { Fabricate(:author) }
  scenario "with valid input succeeds" do
    visit root_path

    click_link "Books", exact: true
    click_link "Add new book"

    fill_in "Title", with: "Ruby"
    fill_in "Isbn", with: "9780876547890"
    fill_in "Description", with: "Learn Ruby Soon"
    fill_in "Published at", with: "2012-1-2"
    fill_in "Page count", with: 345
    fill_in "Price", with: 34.99
    select "Peachpit Press", from: "Publisher"
    check author1.full_name
    check author2.full_name

    click_button "Create Book"

    expect(page).to have_content("Book has been created")
  end

  scenario "with invalid input failures" do
  end

end