json.array!(@coupons) do |coupon|
  json.extract! coupon, :id
  json.url coupon_url(coupon, format: :json)
end
