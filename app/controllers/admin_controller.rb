class AdminController < ApplicationController
  before_filter :authorized?

  # add_breadcrumb "Admin", :admin_path

  private

	  def authorized?
	    unless current_user.try(:admin?)
	      flash[:error] = "Você não está autorizado à acessar esta página."
	      redirect_to root_path
	    end
	  end

end
