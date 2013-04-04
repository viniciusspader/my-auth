class Ability
  include CanCan::Ability

  def initialize(resource)

    resource ||= AdminUser.new

    if resource.is_a?(User)
      alias_action :edit, :settings, :to => :modify
      can [:read, :modify, :update], User,:id => current_user.id
    elsif resource.is_a?(AdminUser)
      can :manage, :all
    end

  end
end
