class Store < ActiveRecord::Base
  extend FriendlyId

  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model|
    if not controller.nil?
      controller.default_current_user ? controller.default_current_user : nil
    end
  }

  acts_as_commentable
  acts_as_votable

  has_many :promotions
	has_many :coupons

  friendly_id :name, use: :slugged

  #validates :title, presence: true
  #validates :body, presence: true

end
