class Ability
  include CanCan::Ability

  def initialize(resource)
    if resource.is_a?(User)
      alias_action :edit, :settings, :to => :modify
      can [:read, :modify, :update], User, :id => resource.id
    end
  end
end
