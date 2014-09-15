# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  source_id  :integer
#  target_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Friend < ActiveRecord::Base
end
