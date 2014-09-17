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

require 'rails_helper'

RSpec.describe Review, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
