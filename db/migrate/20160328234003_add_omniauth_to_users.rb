class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider_facebook, :string
    add_column :users, :uid_facebook, :string
  end
end
