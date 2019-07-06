class SessionsController < ApplicationController
  before_action :logged_in?, only:[:logout]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: session_params[:username])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

#new session path when logging in through GitHub account
  def gh_create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['nickname']
      u.first_name = auth['info']['name']
      u.email = auth['info']['email']
      u.profile_img = auth['info']['image']
      u.github_link = auth['info']['urls']['GitHub']
      u.uid = auth['uid']
      u.password = SecureRandom.urlsafe_base64(n=6)
    end

    session[:user_id] = @user.id

    if @user.user_type.nil?
      redirect_to choose_user_type_path
    else
      redirect_to user_path(@user)
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

  def auth
   request.env['omniauth.auth']
  end
end
