class AddCountersCacheComments < ActiveRecord::Migration
  def change
    add_column :promotions, :comments_count, :integer, :default => 0
    add_column :coupons, :comments_count, :integer, :default => 0
    add_column :stores, :comments_count, :integer, :default => 0

    Promotion.reset_column_information
    Promotion.all.each do |p|
      p.update_attribute :comments_count, p.comments.length
    end

    Coupon.reset_column_information
    Coupon.all.each do |p|
      p.update_attribute :comments_count, p.comments.length
    end

    Store.reset_column_information
    Store.all.each do |p|
      p.update_attribute :comments_count, p.comments.length
    end
  end
end
