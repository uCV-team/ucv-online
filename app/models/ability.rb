class Ability
  include CanCan::Ability

  def initialize(current_user)
    return unless current_user
    user_permissions
  end

  def user_permissions
    can :manage, User
    can :manage, Contact
    can :manage, Cv
    can :manage, Education
    can :manage, Experience
    can :manage, Language
    can :manage, Location
  end
end
