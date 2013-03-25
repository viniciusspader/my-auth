class UsersController < ApplicationController

  before_filter :authenticate_user!

  load_and_authorize_resource

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end

end
