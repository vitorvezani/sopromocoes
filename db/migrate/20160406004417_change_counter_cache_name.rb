class ChangeCounterCacheName < ActiveRecord::Migration
  def change
    rename_column :coupons, :counter_cache, :impressions_count
    rename_column :promotions, :counter_cache, :impressions_count
  end
end
