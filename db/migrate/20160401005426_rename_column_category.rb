class RenameColumnCategory < ActiveRecord::Migration
  def change
    rename_column :categories, :text, :name
  end
end
