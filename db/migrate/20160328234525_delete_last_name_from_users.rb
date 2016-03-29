class DeleteLastNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :last_name, :string
    rename_column :users, :first_name, :name
  end
end
