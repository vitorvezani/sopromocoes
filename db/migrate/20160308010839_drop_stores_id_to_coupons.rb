class DropStoresIdToCoupons < ActiveRecord::Migration
  def change
  	remove_column :coupons, :stores_id
  	rename_column :promotions, :stores_id, :store_id
  end
end
