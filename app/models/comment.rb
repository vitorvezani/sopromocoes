class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model|
    if not controller.nil?
      controller.default_current_user ? controller.default_current_user : nil
    end
  }

  belongs_to :commentable, polymorphic: true, counter_cache: true

  default_scope -> { order(created_at: :desc) }

  acts_as_votable

  belongs_to :user

  validates :title, :comment, presence: true

end
