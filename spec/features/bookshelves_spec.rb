require 'rails_helper'

feature 'BookShelves' do

  describe 'when not logged in' do
    
    it 'should not have a viewable index' do
      visit bookshelves_path
      expect( page ).to have_content "Log in"
    end
  end

  describe 'when logged in' do
  
    before :each do
      @user = create :user
      login @user
    end
  
    it 'should have a viewable index' do
      visit bookshelves_path
      expect( page ).to have_content "Log Out"
      expect( page ).to have_content "Bookshelves"
    end

    it 'should have a list of bookshelves' do
      @shelf = create :book_shelf
      visit bookshelves_path
      expect( page ).to have_content @shelf.name
    end
  
  end  
end 
