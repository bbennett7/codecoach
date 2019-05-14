class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      return head(:forbidden) unless @student.authenticate(params[:student][:password])
      session[:user_id] = @student.id
      redirect_to student_path(@student)
    else
      redirect_to new_student_path
    end
  end

  def show

  end

  private

  def student_params
    params.require(:student).permit(:username, :first_name, :last_name, :email, :profile_img, :location, :github_link, :password, :password_confirmation)
  end
end
