class Ability
  include CanCan::Ability

  def initialize(current_user)
    guest_permissions
    return unless current_user
    if current_user.role?('admin')
      admin_permissions
    else
      user_permissions(current_user)
    end
  end

  def guest_permissions
    can :read, Location
    can :read, Cv, published: true
    can :create, Message
  end

  def admin_permissions
    can :manage, :all
  end

  def user_permissions(current_user)
    can :manage, User, id: current_user.id
    can :manage, Message, user: current_user
    can :manage, Cv, user: current_user
    can :manage, Education
    can :manage, Experience
    can :manage, Language
    can :manage, Location
  end
end
