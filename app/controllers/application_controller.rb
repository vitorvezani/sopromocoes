class ApplicationController < ActionController::Base
  before_filter :all_categories

  add_breadcrumb 'Home', :root_path

  def all_categories
      @all_categories = all_cached_categories
  end

  def owns_record(record)
    return false if record.user.nil? or current_user.nil?
    current_user.id.to_s == record.user.id.to_s
  end

  # BEGIN OF HACK
  # Hack to set the current user to use in the model
  include PublicActivity::StoreController

  def default_current_user
    @current_user ||= current_user
  end

  helper_method :default_current_user
  hide_action :default_current_user
  # END OF HACK

  # Dado um record, retorna se o usuário é 'dono' do mesmo
  # se não for, seta a variavel @error
  def require_ownership(record)
    if !owns_record(record)
      @error = 'Você não tem autoridade para criar/deletar/alterar esse registro'
    end
  end
  #

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def all_cached_categories
      Rails.cache.fetch('all_cached_categories', expires_in: 12.hours) do
        Category.where(parent_id: nil).includes(:subcategories)
      end
    end

    def authorized?
      unless current_user.try(:admin?)
        flash[:error] = 'Você não está autorizado à acessar esta página.'
        redirect_to root_path
      end
    end
end
