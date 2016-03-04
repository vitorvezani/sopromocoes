class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|

    	t.string :name, null: false
      t.text :description
			t.string :twitter
      t.text :logo_url
      t.text :url

      t.timestamps null: false
    end
  end
end
