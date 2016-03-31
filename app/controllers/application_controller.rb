class ApplicationController < ActionController::Base
  before_filter :all_categories

  def all_categories
      @all_categories = all_cached_categories
  end

  include PublicActivity::StoreController

  def default_current_user
    @current_user ||= current_user
  end

  helper_method :default_current_user
  hide_action :default_current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def all_cached_categories
      Rails.cache.fetch("all_cached_categories", expires_in: 12.hours) do
        Category.where(parent_id: nil).includes(:subcategories)
      end
    end
end
