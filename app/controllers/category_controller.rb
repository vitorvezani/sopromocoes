class CategoryController < ApplicationController

  def index
    @category = nil
    @categories = Category.find(:all, :conditions => {:parent_id => nil } )
  end

  # Show subcategory
  def show
    # Find the category belonging to the given id
    @category = Category.find(params[:id])
    # Grab all sub-categories
    @categories = @category.subcategories
    # We want to reuse the index renderer:
    render :action => :index
  end

  def new
    @category = Category.new
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
  end

end
