class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user = Mentor.find_by_id(session[:mentor_id]) || Student.find_by_id(session[:student_id])
  end

  def student_or_mentor_path(user)
    if session[:mentor_id]
      mentor_path(user)
    elsif session[:student_id]
      student_path(user)
    end
  end

  def student_or_mentor_resources_path(user)
    if session[:mentor_id]
      mentor_resource_path(user)
    elsif session[:student_id]
      student_resource_path(user)
    end
  end

end
