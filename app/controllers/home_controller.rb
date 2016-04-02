class HomeController < ApplicationController

  def about
    add_breadcrumb "Sobre", :about_path
  end

  def contact
    add_breadcrumb "Contato", :contact_path
  end
end
