require 'rails_helper'

feature 'Recommendation', :js do
  it 'sends an email' do
    ActionMailer::Base.deliveries.clear
    @user = create :user
    @friend = create :user
    @book = create :book
    @friend.friend! @user
    @user.friend! @friend
    login @user

    visit book_path(@book)
    click_on 'Recommend to a Friend'
    select @friend.email, from: 'recommendation[recipient_id]'
    fill_in 'recommendation[text]', with: "I think you will like this!"
    click_on 'Send'
    wait_for_ajax
    msg = ActionMailer::Base.deliveries.last

    expect( msg.from ).to eq [@user.email]
    expect( msg.to ).to eq [@friend.email]
    expect( msg.subject ).to eq "#{@book.title} recommendation"
    expect( ActionMailer::Base.deliveries.count ).to eq 1
  end
    
end
