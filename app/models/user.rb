class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def friends
    # FIXME: this should probably be a has_many :through =>
    #   / allow for doing JOINs
    target_ids = Friend.where(source_id: id).pluck :target_id
    User.find target_ids
  end
end
