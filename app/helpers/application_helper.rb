module ApplicationHelper
	def random_bootstrap_color
		[:danger, :success, :info, :warning].sample
	end

  # <devise>
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  # </devise>

  def resource_to_friendly_link(resource)
    '/' + resource.class.name.downcase.pluralize + '/' +  resource.slug
  end

  def love_class(item)
    return 'fa-heart-o' unless user_signed_in?
    return current_user.voted_for?(item) ? 'fa-heart' : 'fa-heart-o'
  end

  def thumbs_class(item)
    return 'fa-thumbs-o-up' unless user_signed_in?
    return current_user.voted_for?(item) ? 'fa-thumbs-up' : 'fa-thumbs-o-up'
  end
end
