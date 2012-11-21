class UsersController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :js

  def new
    respond_with @user
  end
  def create
    if @user.save
      flash[:notice] = I18n.t('users.create.notice')
      session[:user_id] = @user.id # So they are logged in.
    end
    respond_with @user, location: root_path
  end


  def index
    respond_with @users
  end

  def show
    respond_with @user
  end

  def edit
    respond_with @user
  end
  def update
    flash[:notice] = I18n.t('users.update.notice') if @user.update_attributes(params[:user])
    respond_with @user
  end

  def destroy
    flash[:notice] = I18n.t('users.destroy.notice') if @user.destroy
    respond_with @user
  end
end
