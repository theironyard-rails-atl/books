require 'rails_helper'

feature 'BookShelves' do

  describe 'when not logged in' do
    
    it 'should not have a viewable index' do
      visit bookshelves_path
      expect( page ).to have_css '.container', text: 'Sign in'
    end
  end

  describe 'when logged in' do
  
    before :each do
      @user = create :user
      login @user
    end
  
    it 'should have a viewable index' do
      visit bookshelves_path
      expect( page ).to have_content "Log out"
      expect( page ).to have_content "Bookshelves"
    end

    it 'should have a list of bookshelves' do
      @shelf = create :book_shelf,user: @user
      visit bookshelves_path
      expect( page ).to have_content @shelf.name
    end

    it 'should only show the bookshelves for the current user' do
      @shelf = create :book_shelf, user: @user
      
      @user2 = create :user
      @shelf2 = create :book_shelf, user: @user2, name: "shelf2 name"

      visit bookshelves_path
      expect( page ).not_to have_content @shelf2.name
      expect( page ).to have_content @shelf.name 
    end
 
    it 'should allow the user to delete a bookshelf' do
      @shelf = create :book_shelf, user: @user, name: "shelf_name"
      
      visit bookshelves_path
      expect( page ).to have_content @shelf.name
      expect( page ).to have_css('#delete_' + "#{@shelf.id}")
      find("#delete_#{@shelf.id}").click
      expect( page ).to_not have_css('button#delete_' + "#{@shelf.id}")
    end

    it 'should allow the user to create a bookshelf' do
      visit bookshelves_path
      expect( page ).to have_css('#create_bookshelf')
      fill_in 'bookshelves_name', :with => 'Test Shelf'
      find('#create_bookshelf').click
      expect( page ).to have_content 'Test Shelf'
    end


  end  
end 
