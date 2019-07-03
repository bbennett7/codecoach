class UsersController < ApplicationController
  # before_action :current_user
  # before_action :logged_in?, except: [:new, :create]
  # before_action :current_user_is_student?, only: [:index]
  #
  # def index
  #   # @available_mentors = Mentor.all.collect{|mentor| mentor if !mentor.has_student?}
  #   # @available_mentors.compact!
  # end
  #
  def new
    @user = User.new
  end
  #
  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     render 'new' unless @user.authenticate(params[:password])
  #     session[:session_id] = @user.id
  #
  #     redirect_to user_path(@user)
  #   else
  #     render 'new'
  #   end
  # end
  #
  # def show
  #   respond_to do |format|
  #     format.json { render json: @current_user.to_json( only: [:username, :first_name, :email, :profile_img, :location, :github_link], include: [languages: {only: :name}] ) }
  #     format.html { render :show }
  #   end
  # end
  #
  # def update
  #   @current_user.update(user_params)
  #   redirect_to user_path(@current_user)
  # end
  #
  # def create_connection
  #   # @current_user.mentor = @mentor
  #   # redirect_to mentor_path(@current_user.mentor)
  # end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:username, :first_name, :last_name, :email, :profile_img, :location, :github_link, :password, :password_confirmation)
  # end
end
