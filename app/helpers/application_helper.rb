module ApplicationHelper
  def session_id
    true if session[:user_id]
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def current_user_is_coach?
    true if current_user.user_type == "coach"
  end

  def current_user_is_student?
    true if current_user.user_type == "student"
  end
end
