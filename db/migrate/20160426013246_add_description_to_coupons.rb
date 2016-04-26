class AddDescriptionToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :description, :text
  end
end
