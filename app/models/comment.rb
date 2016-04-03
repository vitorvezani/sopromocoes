class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.default_current_user ? controller.default_current_user : nil }

  belongs_to :commentable, polymorphic: true

  default_scope -> { order('created_at ASC') }

  acts_as_votable

  # NOTE: Comments belong to a user
  belongs_to :user


  #validates :title, presence: true
  #validates :body, presence: true

end
