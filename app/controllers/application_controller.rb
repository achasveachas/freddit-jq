class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :can_edit?

  def index
    render 'index'
  end

  private

  def login(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) unless session[:user_id] == nil
  end

  def can_edit?
    current_user && !current_user.banned (current_user.admin || @user == current_user)
  end
end
