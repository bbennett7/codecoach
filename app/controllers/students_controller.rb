class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
  end

  private

  def student_params
    params.require(:student).permit(:username, :first_name, :last_name, :email, :profile_img, :location, :github_link, :password, :password_confirmation)
  end
end
