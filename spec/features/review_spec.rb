require 'rails_helper'

feature 'Reviews', :js do
  before :each do
    @user = create :user
    login @user

    @book = create :book
    visit book_path @book
  end

  it 'can write a review' do
    click_on 'Add Review'
    fill_in 'review[rating]', with: 4
    fill_in 'review[text]', with: 'Testing review'
    click_on 'Save'

    expect( page ).to have_content 'Testing review'
    expect( Review.last.text ).to eq 'Testing review'
  end
end
