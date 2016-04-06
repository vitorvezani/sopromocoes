class AddingCounterCacheToModels < ActiveRecord::Migration
  def change
    add_column :promotions, :counter_cache, :integer, default: 0
    add_column :coupons, :counter_cache, :integer, default: 0
  end
end
