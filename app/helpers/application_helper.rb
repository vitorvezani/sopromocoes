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
end
