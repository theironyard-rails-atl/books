require 'rails_helper'

describe UsersController do
  render_views

  before :each do
    @me, @alice, @bob = 3.times.map { create :user }
    sign_in @me
  end

  it 'can see a list of users' do
    get :index
    expect( response.json.length ).to eq 3
  end

  it 'can friend users' do
    # params = { id: 2 }
    post :friend, id: @alice.id
    expect( response ).to be_successful
    # Rspec matcher for
    # expect( response.successful? ).to eq true

    get :friends
    expect( response.json.length ).to eq 1
  end

  it 'can unfriend users' do
    # define a belongs_to or use ids ...
    Friend.create! source_id: @me, target_id: @alice

    post :unfriend, id: @alice.id
    expect( response ).to be_successful

    get :friends
    expect( response.json.length ).to eq 0
  end
end
