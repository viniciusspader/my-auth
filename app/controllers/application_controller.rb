class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to current_user, :alert => exception.message
  end

  def after_sign_in_path_for(user)
    current_user
  end

end
