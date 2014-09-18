class BookSearch
  include HTTParty
  base_uri 'https://www.googleapis.com/books/v1'
  default_params key: ENV['GOOGLE_BOOKS_KEY']

  # new('Potter')
  # new('Potter', author: 'Rowling) ~>
  #   new('Potter', { author: 'Rowling' })
  # So second arg is a hash, and is optional
  def initialize search_term, opts={}
    @search_term = search_term
    # v- works if you pass in a hash for opts
    @author = opts[:author]
  end

  def build_search_q
    q = @search_term
    if @author
      q += "+inauthor:#{@author}"
    end
    q
  end

  # https://www.googleapis.com/books/v1/volumes?q=search+terms&key=...
  # /volumes?q=...
  # /volumes?q=Potter+inauthor:Rowling
  def run
    # eq. to BookSearch.get _for instances of this class_
    #   but different for subclasses
    response = self.class.get '/volumes', query: { q: build_search_q }
    response["items"]
  end
end
