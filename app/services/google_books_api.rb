class GoogleBooksApi
  include HTTParty
  base_uri 'https://www.googleapis.com/books/v1/'
  default_params api_key: ENV["GOOGLE_KEY"]

  def self.search volume_info
    #/volumes?q=<search_term>
    @response = self.get "/volumes", query: { q: volume_info }
  end

end
