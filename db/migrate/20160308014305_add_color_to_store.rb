class AddColorToStore < ActiveRecord::Migration
  def change
    add_column :stores, :color, :string
  end
end
