class SessionsController < ApplicationController

  before_filter :authenticate_admin_user!
  before_filter :authenticate_user!

  def new
  end

  def destroy
  end

end
