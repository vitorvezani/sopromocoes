class Promotion < ActiveRecord::Base
  extend FriendlyId

  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model|
    if not controller.nil?
      controller.try(:default_current_user) ? controller.default_current_user : nil
    end
  }

  acts_as_votable
  acts_as_commentable

  is_impressionable counter_cache: { unique: [:impressionable_type, :impressionable_id, :session_hash] }

	belongs_to :user, counter_cache: true
	belongs_to :store

  friendly_id :slug_candidates, use: :slugged

  #validates :title, presence: true
  #validates :body, presence: true

  def slug_candidates
    [
      :name,
      [:name, store[:name]],
      [:name, store[:name], :created_at ]
    ]
  end

end
