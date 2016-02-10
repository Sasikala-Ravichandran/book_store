require 'rails_helper'

RSpec.feature "Searching for Books" do

  let!(:ajax) { Fabricate(:book, title: 'Ajax in Rails') }
  let!(:railsway) { Fabricate(:book, title: 'The Rails Way 3') }

  scenario "with existing title returns all those books" do
    
    visit '/'
    
    fill_in "search_word", with: "Ajax"
    click_button "Search"

    expect(page).to have_content(ajax.title)
    expect(page).to have_content(railsway.title)
    expect(current_path).to eq(search_catalogs_path) 
  end

end