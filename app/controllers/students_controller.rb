class StudentsController < ApplicationController
  before_action :current_user
  before_action :logged_in?, except: [:new, :create]
  before_action :logged_out?, only: [:new]
  before_action :find_mentor, only: [:add_mentor]

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

  def show
    respond_to do |format|
      format.json { render json: @current_user.to_json( only: [:username, :first_name, :email, :profile_img, :location, :github_link], include: [languages: {only: :name}] ) }
      format.html { render :show }
    end
  end

  def update
    @current_user.update(student_params)
    redirect_to student_path(@current_user)
  end

  def add_mentor
    @current_user.mentor = @mentor
    redirect_to mentor_path(@current_user.mentor)
  end

  private

  def student_params
    params.require(:student).permit(:username, :first_name, :last_name, :email, :profile_img, :location, :github_link, :password, :password_confirmation)
  end
end
