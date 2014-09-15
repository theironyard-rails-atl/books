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
  validates_presence_of :title, :author, :isbn, :description, :image_url
end
