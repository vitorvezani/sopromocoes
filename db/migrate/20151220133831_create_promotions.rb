class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|

    	t.string :name
			t.text :description
    	t.float :price_from
    	t.float :price_to
    	t.float :price_billet
    	t.float :percent_discount
      t.datetime :init_at
      t.datetime :end_at
      t.text :link
      t.text :img_link
      t.references :user

      t.timestamps null: false
    end
  end
end
