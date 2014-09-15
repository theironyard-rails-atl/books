# == Schema Information
#
# Table name: recommendations
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  recipient_id :integer
#  book_id      :integer
#  text         :text
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Recommendation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
