class Book < ActiveRecord::Base

  validates_presence_of :title, :author, :isbn, :description
  has_and_belongs_to_many :categories
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  has_many :recommendations
  has_many :reviews

  def book_data_lookup
    return false unless self.isbn
    data = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=+isbn:#{self.isbn}&key=#{ENV['GOOGLE_BOOKS_API']}")
    puts(self.isbn)
    if data["totalItems"] == 1
      item = data["items"][0]["volumeInfo"]
      self.title ||= item["title"]
      self.author ||= item["authors"][0]
      self.description ||= item["description"]
      if item["imageLinks"]
        self.image_url = item["imageLinks"]["thumbnail"]
      end
      item["categories"].each do |category_string|
        category = Category.find_by_name category_string
        if category
          self.categories.push category
        else
          self.categories.new(name: category_string)
        end
      end
    end
  end
end
