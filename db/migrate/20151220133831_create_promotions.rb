class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|

    	t.string    :name,         null: false
			t.text      :description
      t.string    :external_id
      t.text      :image_url
      t.float     :discount
    	t.float     :price_from
    	t.float     :price_to,     null: false
    	t.float     :price_billet
      t.text      :url,          null: false
      t.boolean   :enabled,      null: false, default: true
      t.string    :affiliate,    null: false
      t.datetime  :begin_at
      t.datetime  :end_at

      t.references :user
      t.references :stores

      t.timestamps null: false
    end
  end
end
