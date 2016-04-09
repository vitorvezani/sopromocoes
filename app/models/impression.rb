class Impression < ActiveRecord::Base

  belongs_to :promotion, counter_cache: true
  belongs_to :coupons, counter_cache: true

end
