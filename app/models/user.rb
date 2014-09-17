class User < ActiveRecord::Base
  def self.create_from_omniauth(params)
    attributes = {
      email: params['info']['email'],
      password: Devise.friendly_token
    }

    create(attributes)
  end


  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :identities


  # FIXME: these should probably be has_many :through =>
  #   / allow for doing JOINs

def self.create_from_omniauth(params)
  attributes = {
    email: params['info']['email'],
    password: Devise.friendly_token
  }

  create(attributes)
end


  #def self.from_omniauth(auth)
  #  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #    user[:provider] = auth.provider
  #    user[:uid] = auth.uid
  #    user[:email] = auth.info.email
  #    user.save!
  #  end
  #end

  #def self.new_with_session(params, session)
  #  if session["devise.user_attributes"]
  #    new(session["devise.user_attributes"], without_protection: true) do |user|
  #      user.attributes = params
  #      user.valid?
  #    end
  #  else
  #    super
  #  end
  #end



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
