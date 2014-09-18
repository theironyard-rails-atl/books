require 'rails_helper'

describe BookSearch do
  it 'can perform a basic search' do
    results = BookSearch.new('Potter').run
    expect( results.count ).to be >= 10
  end

  it 'can search by author'
end
