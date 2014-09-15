class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :identities

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
    Friends.where(source_id: id, target_id: other.id).first_or_create!
  end

  def unfriend! other
    Friends.where(source_id: id, target_id: other.id).delete_all
  end
end
