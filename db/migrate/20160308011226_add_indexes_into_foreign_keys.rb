class AddIndexesIntoForeignKeys < ActiveRecord::Migration
  def change
  	add_index :promotions, :user_id
  	add_index :promotions, :store_id
  end
end
