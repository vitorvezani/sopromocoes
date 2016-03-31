class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.default_current_user ? controller.default_current_user : nil }

  belongs_to :commentable, polymorphic: true

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user


  #validates :title, presence: true
  #validates :body, presence: true

end
