require 'rails_helper'

describe BookSearch do
  focus 'can perform a basic search' do
    VCR.use_cassette 'basic_search' do
      results = BookSearch.new('Potter').run
      expect( results.count ).to be >= 10
    end
  end

  it 'can search by author' do
    results = BookSearch.new('Potter', author: 'Rowling').run
    expect( results.count ).to be >= 7

    results.each do |result|
      authors = result["volumeInfo"]["authors"]
      # At least one author matches 'Rowling'
      #match = authors.find { |a| a =~ /rowling/i }
      #expect( match ).not_to be nil
      names = authors.join ','
      expect( names.downcase ).to include 'rowling'
    end
  end

  it 'builds the right search query' do
    # Maybe this should be different from the above setup?
    q = BookSearch.new('Potter', author: 'Rowling').build_search_q
    expect( q ).to eq 'Potter+inauthor:Rowling'
  end
end
