class ApplicationController < ActionController::Base
  def mentor_login
    @mentor = Mentor.new
  end

  def student_login
    @student = Student.new 
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
