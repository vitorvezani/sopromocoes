class AddCountersCache < ActiveRecord::Migration
  def change
    add_column :users, :promotions_count, :integer, :default => 0
    add_column :users, :coupons_count, :integer, :default => 0

    User.reset_column_information
    User.all.each do |p|
      p.update_attribute :promotions_count, p.promotions.length
      p.update_attribute :coupons_count, p.coupons.length
    end
  end
end
