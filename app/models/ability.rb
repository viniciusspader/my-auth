class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= AdminUser.new

    if user.admin?
      can :manage, :all
    else
      alias_action :edit, :settings, :to => :modify
      can [:read, :update, :modify, :destroy], User, id: user.id
    end

  end
end
