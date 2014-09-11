class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates_presence_of :user, :book, :text, :rating
  validates_uniqueness_of :book, scope: :user
end
