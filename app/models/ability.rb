class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all, :id => user.id
  end
end
