module CommentsHelper

  def resource_to_link(resource)
    '/' + resource.class.name.downcase.pluralize + '/' +  resource.id.to_s
  end

end
