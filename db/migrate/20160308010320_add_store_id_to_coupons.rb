class AddStoreIdToCoupons < ActiveRecord::Migration
  def change
  	change_table :coupons do |t|
  		t.references(:store, index: true)
  	end
  end
end