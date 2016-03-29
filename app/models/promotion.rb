class Promotion < ActiveRecord::Base

  acts_as_votable
  acts_as_commentable

	belongs_to :user
	belongs_to :store

end
