require 'rails_helper'

describe 'Friendships', js:true do
  it 'should have a link to the Users page on header' do
    visit root_path
    within("#navigation-links") { expect( page ).to have_content("Friendships") }
  end

  describe "current friends tab" do
    it "should have a tab called current friends" do
      visit friendships_users_path
      within('.friends-content') { expect( page ).to have_content( "Current Friends") }
    end
    it "should show a user's current friends"
    it "should have a button to defriend existing frends"
  end

  it "should have a tab listing potential friends"
  it "should have a button to confirm a friend request"
  it "should have a tab of pending friend requests"
  it "should have a button to friend a user who is not a friend"
  it "shoudl not have a button to refriend users who are already friends"
end