class Book < ActiveRecord::Base
  validates_presence_of :title, :author, :isbn, :description, :image_url
end
