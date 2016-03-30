class AddIndexCategory < ActiveRecord::Migration
  def change
    add_index :categories, [:text, :parent_id], unique: true
  end
end
