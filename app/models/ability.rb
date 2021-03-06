class Ability
  include CanCan::Ability

  def initialize(current_user)
    guest_permissions
    return unless current_user

    user_permissions(current_user)
    admin_permissions if current_user.role?('admin')
  end

  def guest_permissions
    can :read, Location
    can :read, Cv, published: true
    can :create, Message
    can :manage, Mailkick::OptOut
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

  def admin_permissions
    can :read, Cv
    can :manage, :dashboards
    can :manage, :users
    can :manage, :flags
    can :manage, :newsletters
    can :manage, :submittal
    can :create, Attachment
  end
end
