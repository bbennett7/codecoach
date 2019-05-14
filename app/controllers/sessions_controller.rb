class SessionsController < ApplicationController
  def mentor_new
    @mentor = Mentor.new
  end

  def student_new
    @student = Student.new
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
end
