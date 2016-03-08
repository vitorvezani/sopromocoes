class AddUserIndexToCoupons < ActiveRecord::Migration
  def change
  	add_index :coupons, :user_id
  end
end
