class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.admin?
      can :access, :rails_admin
      can :manage, :all
      can :manage, Piggybak.config.manage_classes.map(&:constantize)
      Piggybak.config.extra_abilities.each do |extra_ability|
        can extra_ability[:abilities], extra_ability[:class_name].constantize
      end
    else
      alias_action :edit, :settings, :to => :modify
      can [:read, :update, :modify, :destroy], User, id: user.id
    end
  end
end
