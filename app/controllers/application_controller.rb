class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user = Mentor.find_by_id(session[:mentor_id]) || Student.find_by_id(session[:student_id])
  end

  def student_or_mentor_path(user)
    if session[:mentor_id]
      redirect_to mentor_path(user)
    elsif session[:student_id]
      redirect_to student_path(user)
    end
  end

end
