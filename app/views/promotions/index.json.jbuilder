json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :name, :description, :external_id, :image_url, :discount, :price_from, :price_to, :price_billet, :url, :enabled, :affiliate, :begin_at, :end_at
  json.url promotion_url(promotion, format: :json)
end
