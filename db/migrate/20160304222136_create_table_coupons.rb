class CreateTableCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string 	  :name, 			null: false
      t.string    :code,      null: false
      t.text      :url
      t.datetime  :begin_at
      t.datetime  :end_at
      t.boolean   :enabled, null: false, default: true
      t.text 	    :rules_url
      t.string 	  :affiliate

      t.references :user
      t.references :stores

      t.timestamps null: false
    end
  end
end
