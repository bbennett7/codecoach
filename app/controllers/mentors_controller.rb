class MentorsController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update]

  def index
    @available_mentors = Mentor.all.collect{|mentor| mentor if mentor.student.nil?}
  end

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new(mentor_params)

    if @mentor.save
      render 'new' unless @mentor.authenticate(params[:mentor][:password])
      session[:mentor_id] = @mentor.id

      redirect_to mentor_path(@mentor)
    else
      render 'new'
    end
  end

  def update
    @current_user.update(mentor_params)
    redirect_to mentor_path(@current_user)
  end

  private

  def mentor_params
    params.require(:mentor).permit(:username, :first_name, :last_name, :email, :profile_img, :location, :github_link, :student_id, :password, :password_confirmation)
  end
end
