class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.is_a?(User)
      redirect_to current_admin_user, :alert => exception.message
    elsif current_user.is_a?(AdminUser)
      redirect_to admin_dashboard_path(current_admin_user), :alert => exception.message
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      current_user
    elsif resource_or_scope.is_a?(AdminUser) 
      admin_dashboard_path(resource_or_scope)
    end
  end

  # This block code is from StackOverflow
  # http://stackoverflow.com/questions/9253587/merging-activeadmin-users-with-existing-user-model
  # and is intended to work with ActiveAdmin and Devise in the authentication process
  #def authenticate_admin_user!
  #  redirect_to root_path and return if user_signed_in? && !current_user.is_admin?
  #  before_filter :authenticate_user!, :except => :index
  #end
  #def current_admin_user
  #  return nil if user_signed_in? && !current_user.is_admin?
  #  current_user
  #end


  private

    def current_ability
      Ability.new(current_user)
    end

end
