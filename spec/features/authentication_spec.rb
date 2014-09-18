require 'rails_helper'

feature 'Authentication' do
  describe 'when logged in' do
    before :each do
      @user = create :user
      login @user
    end

    it 'has logged the user in' do
      expect( page ).to have_content "Signed in"
      expect( page ).to have_content @user.email
    end
  end

  describe 'when not logged in' do
    it 'is not authenticated'
  end
end
