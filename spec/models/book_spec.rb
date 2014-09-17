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

require 'rails_helper'

RSpec.describe Book, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
