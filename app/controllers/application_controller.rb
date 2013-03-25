class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def stored_location_for(user)

  end

  def after_sign_in_path_for(user)
    current_user
  end

end
