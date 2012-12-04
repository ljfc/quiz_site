class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logout
    session[:user_id] = nil
    @current_user = nil
  end

  def current_session_id
    @current_session_id ||= request.session_options[:session_id]
    @current_session_id ||= request.session_options[:id]
  end

end
