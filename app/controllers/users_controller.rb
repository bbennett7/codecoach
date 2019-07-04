class UsersController < ApplicationController
  before_action :current_user
  # before_action :logged_in?, except: [:new, :create]
  # before_action :current_user_is_student?, only: [:index]
  #
  def index
    @available_coaches = User.all.collect{|user| user if user.connection_id.nil? && user.user_type == "coach"}
    @available_coaches.compact!

    @connection = Connection.new 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.profile_img = "/images/no-photo.png" if @user.profile_img.empty?

    if @user.save && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
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
    @current_user.update(user_params)
    redirect_to user_path(@current_user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :user_type, :email, :profile_img, :location, :github_link, :password, :password_confirmation)
  end

  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end
end
