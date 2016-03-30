module UsersHelper
  def same_user(user, other_user)
    return false if user.nil? or other_user.nil?
    user.email == other_user.email
  end

  def same_user(other_user)
    return false if other_user.nil? or current_user.nil?
    current_user.email == other_user.email
  end

  def owns_record(record)
    return false if record.user.nil? or current_user.nil?
    current_user.email == record.user.email
  end
end
