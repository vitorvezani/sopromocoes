class AddKeysToPromotions < ActiveRecord::Migration
  def change
  	add_index :coupons, [:name, :affiliate], unique: true
  	add_index :promotions, [:name, :affiliate], unique: true
  end
end
