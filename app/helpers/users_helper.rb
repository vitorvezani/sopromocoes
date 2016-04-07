module UsersHelper

  def is_logged_user(other_user)
    return false if other_user.nil? or current_user.nil?
    current_user.id.to_s == other_user.id.to_s
  end

  def owns_record(record)
    return false if record.user.nil? or current_user.nil?
    current_user.id.to_s == record.user.id.to_s
  end
end
