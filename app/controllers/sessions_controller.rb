class SessionsController < ApplicationController
  def mentor_new
    @mentor = Mentor.new
  end

  def student_new
    @student = Student.new
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
