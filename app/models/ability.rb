class Ability
  include CanCan::Ability

  def initialize(resource)

    resource ||= AdminUser.new

    if resource.is_a?(AdminUser)
      can :manage, :all
    else
      alias_action :edit, :settings, :to => :modify
      can [:read, :modify, :update], User, :id => resource.id
    end

  end
end
