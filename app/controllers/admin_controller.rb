class AdminController < ApplicationController
  before_filter :authorized?

  # add_breadcrumb 'Admin', :admin_path

end
