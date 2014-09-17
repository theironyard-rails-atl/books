# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#

require 'rails_helper'

describe User do
  before :each do
    @user  = create :user
    @other = create :user
  end

  it 'can friend a user' do
    @user.friend! @other
    expect( @user.friends ).to include @other
    # expect( @other.friends ).not_to include @other
    expect( @other.friends ).not_to include @user
  end

  it 'can unfriend a user' do
    @user.friend! @other
    @user.unfriend! @other
    expect( @user.friends ).to be_empty
  end
end
