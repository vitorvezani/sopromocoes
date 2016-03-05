json.array!(@stores) do |store|
  json.extract! store, :id, :name, :description, :twitter, :logo_url, :url
  json.url store_url(store, format: :json)
end
