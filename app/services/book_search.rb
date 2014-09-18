class BookSearch
  include HTTParty
  base_uri 'https://www.googleapis.com/books/v1'
  default_params key: ENV['GOOGLE_BOOKS_KEY']

  def initialize search_term
    @search_term = search_term
  end

  # https://www.googleapis.com/books/v1/volumes?q=search+terms&key=...
  # /volumes?q=...
  def run
    # eq. to BookSearch.get _for instances of this class_
    #   but different for subclasses
    response = self.class.get '/volumes', query: { q: @search_term }
    response["items"]
  end
end
