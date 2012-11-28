class IdentitiesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :js

  def new
    respond_with @identity
  end
  def create
    flash[:notice] = I18n.t([:identities, :create, :notice]) if @identity.save
    respond_with @identity
  end


  def index
    respond_with @identities
  end

  def show
    respond_with @identity
  end

  def edit
    respond_with @identity
  end
  def update
    flash[:notice] = I18n.t([:identities, :update, :notice]) if @identity.update_attributes(params[:identity])
    respond_with @identity
  end

  def destroy
    flash[:notice] = I18n.t([:identities, :destroy, :notice]) if @identity.destroy
    respond_with @identity
  end
end
