class Book < ActiveRecord::Base

  validates_presence_of :title, :author, :isbn, :description

  def book_data_lookup
    return false unless self.isbn
    data = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=+isbn:#{self.isbn}")
    if data["totalItems"] == 1
      item = data["items"][0]
      self.title ||= item["volumeInfo"]["title"]
      self.author ||= item["volumeInfo"]["authors"][0]
      self.description ||= item["volumeInfo"]["description"]
      if item["volumeInfo"]["imageLinks"]
        self.image_url = item["volumeInfo"]["imageLinks"]["thumbnail"]
      end
    end
  end
end
