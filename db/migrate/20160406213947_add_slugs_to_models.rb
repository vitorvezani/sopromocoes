class AddSlugsToModels < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string, unique: true
    add_column :coupons, :slug, :string, unique: true
    add_column :promotions, :slug, :string, unique: true
    add_column :stores, :slug, :string, unique: true
    add_column :users, :slug, :string, unique: true
  end
end
