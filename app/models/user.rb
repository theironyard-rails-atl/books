class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # FIXME: these should probably be has_many :through =>
  #   / allow for doing JOINs
  def friends
    target_ids = Friend.where(source_id: id).pluck :target_id
    User.find target_ids
  end

  def received_recommendations
    Recommendation.where(recipient: self)
  end

  def friend! other
    Friend.where(source_id: id, target_id: other.id).first_or_create!
  end

  def unfriend! other
    Friend.where(source_id: id, target_id: other.id).delete_all
  end

  # This is the reverse of the friends relation; see
  # the comment above
  def messagable_friends
    source_ids = Friend.where(target_id: id).pluck :source_id
    User.find source_ids
  end
end
