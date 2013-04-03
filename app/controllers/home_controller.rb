class HomeController < ApplicationController

  before_filter :authenticate_admin_user!, :except => :index
  before_filter :authenticate_user!, :except => :index

  def index
  end

end
