class Store < ActiveRecord::Base

  acts_as_commentable
  acts_as_votable

  has_many :promotions
	has_many :coupons

end
