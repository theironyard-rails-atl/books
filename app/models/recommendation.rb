class Recommendation < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  belongs_to :book

  validates_presence_of :sender, :recipient, :book, :text

  validate :users_are_friends

private

  def users_are_friends
    if recipient && !recipient.friends.include?(sender)
      errors.add :recipient_id, "must be a friend"
    end
  end
end
