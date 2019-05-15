module ApplicationHelper
  def session_id
    true if session[:mentor_id] || session[:student_id]
  end

  def current_user
    if session[:mentor_id]
      Mentor.find_by_id(session[:mentor_id])
    elsif session[:student_id]
      Student.find_by_id(session[:student_id])
    end 
  end
end
