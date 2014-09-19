# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  book_id    :integer
#  text       :text
#  rating     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates_presence_of :user, :book, :text, :rating
  validates_uniqueness_of :book, scope: :user

  def grav_url
    self.user.gravatar_url
  end
end
