require 'rails_helper'

feature 'Book search' do
  before :each do
    @user = create :user
    login @user
  end

  it 'lets a user search for a book to add' do
    visit books_path

    fill_in 'search_input', with: 'Potter'
    click_on 'Search'

    expect( page.find('.results') ).to have_content 'Potter'
    expect( page ).to have_css '.btn.save'
  end

  it 'lets a user save a found book'
end
