class MentorsController < ApplicationController
  before_action :current_user
  before_action :logged_in?, except: [:new, :create]
  before_action :logged_out?, only: [:new]
  before_action :student_logged_in?, only: [:index]
  before_action :mentor_logged_in?, except: [:index, :new, :create]

  def index
    @available_mentors = Mentor.all.collect{|mentor| mentor if !mentor.has_student?}
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
