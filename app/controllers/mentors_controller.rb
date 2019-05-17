class MentorsController < ApplicationController
  before_action current_user, only: [:show, :edit]

  def index
    @available_mentors = Mentor.all.collect{|mentor| mentor if mentor.student.nil?}
  end

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new(mentor_params)

    if @mentor.save
      return head(:forbidden) unless @mentor.authenticate(params[:mentor][:password])
      session[:mentor_id] = @mentor.id
      redirect_to mentor_path(@mentor)
    else
      render 'new'
    end
  end

  def show
    @mentor = Mentor.find_by_id(params[:id])
  end

  def edit
  end

  def update
    @current_user.update(mentor_params)

    redirect_to mentor_path(@current_user)
  end

  def show_student
  end

  private

  def mentor_params
    params.require(:mentor).permit(:username, :first_name, :last_name, :email, :profile_img, :location, :github_link, :student_id, :password, :password_confirmation)
  end

  def cuurent_user
    @current_user = Mentor.find_by_id(session[:mentor_id])
  end
end
