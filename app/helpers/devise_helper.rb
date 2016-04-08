module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
      <div class="alert alert-error alert-danger">
        <button type="button" class="close" data-dismiss="alert">×</button>
        #{messages}
      </div>
    HTML

    html.html_safe
  end

  def is_admin?
    current_user ? current_user.admin? : false
  end

  def is_logged_user_other_user(other_user)
    return false if other_user.nil? or current_user.nil?
    current_user.id.to_s == other_user.id.to_s
  end

  def owns_record(record)
    return false if record.user.nil? or current_user.nil?
    current_user.id.to_s == record.user.id.to_s
  end
end
