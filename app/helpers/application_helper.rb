module ApplicationHelper
	def random_bootstrap_color
		[:danger, :success, :info, :warning].sample
	end
end
