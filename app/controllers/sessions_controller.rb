class SessionsController < ApplicationController
  def new
    @identity = Identity.new
  end

  def create
    logout # Just for safety; this method should never get called by a logged-in user.
    @identity = Identity.from_omniauth(env['omniauth.auth'])
    @identity.user.take_over_session(current_session_id) if session[:assign_to_user]
    if @identity.save
      session[:user_id] = @identity.user_id
      redirect_to root_path, notice: I18n.t(:you_are_logged_in)
    else
      flash.now.alert = I18n.t(:login_or_password_invalid)
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: I18n.t(:you_are_logged_out)
  end

  def failure
    redirect_to root_path, alert: I18n.t(:authentication_failed)
  end

  def assign_to_user
    session[:assign_to_user] = true
    redirect_to signup_path
  end

end
