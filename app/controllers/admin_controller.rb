class AdminController < ApplicationController
  before_filter :authorized?

  private

	  def authorized?
	    unless current_user.admin?
	      flash[:error] = "Você não está autorizado para acessar esta página."
	      redirect_to root_path
	    end
	  end

end