# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  author      :string(255)
#  isbn        :string(255)
#  image_url   :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  created_by  :integer
#

class Book < ActiveRecord::Base

  belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  has_many :recommendations
  has_many :reviews

  validates_presence_of :title, :author, :isbn, :description, :image_url
end

#TODO need to figure out reccomendations
