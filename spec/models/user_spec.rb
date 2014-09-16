require 'rails_helper'

describe User do
  before :each do
    @user  = create :user
    @other = create :user
  end

  it 'can friend a user' do
    @user.friend! @other
    expect( @user.friends ).to include @other
    expect( @other.friends ).not_to include @other
  end

  it 'can unfriend a user' do
    @user.friend! @other
    @user.unfriend! @other
    expect( @user.friends ).to be_empty
  end
end
