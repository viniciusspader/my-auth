class Ability
  include CanCan::Ability

  def initialize(resource)
    if resource.is_a?(User)
      can [:read, :edit], User, :id => resource.id
    end
  end
end
