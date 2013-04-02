class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to current_user, :alert => exception.message
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      current_user
    elsif resource_or_scope.is_a?(AdminUser) 
      admin_dashboard_path(resource_or_scope)
    end
  end
end
