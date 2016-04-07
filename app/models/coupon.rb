class Coupon < ActiveRecord::Base
  extend FriendlyId

  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.default_current_user ? controller.default_current_user : nil }

  acts_as_votable
  acts_as_commentable

  is_impressionable counter_cache: true, unique: [:impressionable_type, :impressionable_id, :session_hash]

  belongs_to :user
	belongs_to :store

  friendly_id :slug_candidates, use: :slugged

  # Try building a slug based on the following fields in increasing order of specificity.
  def slug_candidates
    [
      :name,
      [:name, :code],
      [:name, :code, store[:name]]
    ]
  end

  #validates :title, presence: true
  #validates :body, presence: true

end
