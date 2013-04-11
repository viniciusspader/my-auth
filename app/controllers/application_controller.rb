class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if !current_user.admin?
      redirect_to current_user, :alert => exception.message
    elsif current_user.admin?
      redirect_to root_path, :alert => exception.message
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.admin?
      current_user
    elsif resource_or_scope.admin?
      admin_dashboard_path(resource_or_scope)
    end
  end

  private

    def current_ability
      Ability.new(current_user)
    end

end
