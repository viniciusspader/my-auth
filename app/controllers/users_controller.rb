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

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      sign_in(@user, :bypass => true)
    end
    respond_to do |format|
      format.js { render 'update_response', :layout => false }
    end
  end

  def settings
    @user = User.find(params[:id])
    respond_to do |format|
      format.js { render 'settings', :locals => { :from => params[:from] } }
    end
  end

end
