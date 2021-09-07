class Ability
  include CanCan::Ability

  def initialize(current_user)
    guest_permissions
    return unless current_user
    user_permissions(current_user)
  end

  def guest_permissions
    can :read, Location
    can :read, Cv, published: true
    can :create, Contact
  end

  def user_permissions(current_user)
    can :manage, User, id: current_user.id
    can :manage, Contact, user: current_user
    can :manage, Cv, user: current_user
    can :manage, Education
    can :manage, Experience
    can :manage, Language
    can :manage, Location
  end
end
