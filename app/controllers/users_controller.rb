class UsersController < ApplicationController

  before_filter :authenticate_user!

  load_and_authorize_resource

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def settings
    @user = User.find(params[:id])
    respond_to do |format|
      format.js { render layout: 'settings'}
    end
  end

end
