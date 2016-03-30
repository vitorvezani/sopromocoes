module CommentsHelper

  def commentable_link(commentable)
    '/' + commentable.class.name.downcase.pluralize + '/' +  commentable.id.to_s
  end

end
