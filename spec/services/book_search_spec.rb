require 'rails_helper'

describe BookSearch do
  it 'can perform a basic search' do
    results = BookSearch.new('Potter').run
    #binding.pry
  end

  it 'can search by author'
end
