json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :name, :code, :url, :begin_at, :end_at, :enabled, :rules_url, :affiliate
  json.url coupon_url(coupon, format: :json)
end
