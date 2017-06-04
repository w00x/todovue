class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  def current_user
    @current_user ||= User.find_by(email: session[:email_user]) if session[:email_user]
  end

  helper_method :current_user

  def authorize
    redirect_to session_index_path unless current_user
  end
end
