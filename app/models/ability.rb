class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)

    case controller_namespace
      when 'Admin'
        can :manage, :all
      when  'User'
        alias_action :edit, :settings, :to => :modify
        can [:read, :update, :modify], :id => user.id
      else
        # pass
    end

  end
end
