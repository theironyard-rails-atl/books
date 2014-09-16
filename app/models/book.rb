class Book < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  has_many :recommendations
  has_many :reviews

  validates_presence_of :title, :author, :isbn, :description, :image_url
end
