class GoogleBooksLookup
  def self.book_lookup(book)
    data = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=+isbn:#{book.isbn}")
    if data["totalItems"] == 1
      item = data["items"][0]
      book.title ||= item["volumeInfo"]["title"]
      book.author ||= item["volumeInfo"]["authors"][0]
      book.description ||= item["volumeInfo"]["description"]
      book.image_url ||= item["volumeInfo"]["imageLinks"]["thumbnail"]
    end
  end
end