class Store < ActiveRecord::Base

  include PublicActivity::Model
  tracked

  acts_as_commentable
  acts_as_votable

  has_many :promotions
	has_many :coupons

  #validates :title, presence: true
  #validates :body, presence: true

end
