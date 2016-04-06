class Promotion < ActiveRecord::Base
  extend FriendlyId

  include PublicActivity::Model
  tracked

  acts_as_votable
  acts_as_commentable

  is_impressionable counter_cache: true

	belongs_to :user
	belongs_to :store

  friendly_id :name, use: :slugged

  #validates :title, presence: true
  #validates :body, presence: true

end
