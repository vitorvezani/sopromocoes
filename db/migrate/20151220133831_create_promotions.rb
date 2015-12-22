class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|

    	t.string :name
			t.string :description
    	t.string :price_from
    	t.string :price_to
    	t.string :price_billet
    	t.string :percent_discount
      t.datetime :init_at
      t.datetime :end_at
      t.string :link
      t.string :img_link


      t.timestamps null: false
    end
  end
end
