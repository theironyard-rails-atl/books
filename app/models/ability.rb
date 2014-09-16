class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Book do |book|
      book.created_by == user.id
    end

  end
end
