module ApplicationHelper
  def session_id
    true if session[:mentor_id] || session[:student_id]
  end
end
