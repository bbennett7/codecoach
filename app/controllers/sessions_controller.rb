class SessionsController < ApplicationController
  def mentor_new
    @user = Mentor.new
  end

  def student_new
    @user = Student.new
  end

  def mentor_create
    @user = Mentor.find_by(username: params[:mentor][:username])
    if @user && @user.authenticate(params[:mentor][:password])
      session[:mentor_id] = @user.id
      redirect_to mentor_path(@user)
    else
      redirect_to mentor_login_path
    end
  end

  def mentor_gh_create
    @user = Mentor.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['nickname']
      u.first_name = auth['info']['name']
      u.email = auth['info']['email']
      u.profile_img = auth['info']['image']
      u.github_link = auth['info']['urls']['GitHub']
      u.uid = auth['uid']
      u.password = SecureRandom.urlsafe_base64(n=6)
    end

    session[:mentor_id] = @user.id
    redirect_to mentor_path(@user)
  end

  def student_create
    @user = Student.find_by(username: params[:student][:username])
    if @user && @user.authenticate(params[:student][:password])
      session[:student_id] = @user.id
      redirect_to student_path(@user)
    else
      redirect_to student_login_path 
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private

  def auth
   request.env['omniauth.auth']
  end
end
