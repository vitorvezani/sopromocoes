class Coupon < ActiveRecord::Base

  include PublicActivity::Model
  tracked

  acts_as_votable
  acts_as_commentable

  belongs_to :user
	belongs_to :store

  #validates :title, presence: true
  #validates :body, presence: true

end
