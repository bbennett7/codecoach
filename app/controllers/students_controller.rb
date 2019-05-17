class StudentsController < ApplicationController
  before_action :current_user, only: [:show, :update, :edit]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      render 'new' unless @student.authenticate(params[:student][:password])
      session[:student_id] = @student.id
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  def update
    @current_user.update(student_params)

    redirect_to student_path(@current_user)
  end

  def add_mentor
    @mentor = Mentor.find_by_id(params[:mentor_id])
    @current_user.mentor = @mentor

    redirect_to mentor_path(@current_user.mentor)
  end

  private

  def student_params
    params.require(:student).permit(:username, :first_name, :last_name, :email, :profile_img, :location, :github_link, :password, :password_confirmation)
  end

  def current_user
    @current_user = Student.find_by_id(session[:student_id])
  end
end
