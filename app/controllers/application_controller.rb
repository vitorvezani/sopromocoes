class ApplicationController < ActionController::Base

  include PublicActivity::StoreController

  def default_current_user
    @current_user ||= current_user
  end

  helper_method :default_current_user
  hide_action :default_current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
