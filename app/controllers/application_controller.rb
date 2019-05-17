class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user = Mentor.find_by_id(session[:mentor_id]) || Student.find_by_id(session[:student_id])
  end

  def logged_in?
    unless !session[:mentor_id].nil? || !session[:student_id].nil?
      redirect_to root_path
    end
  end

  def mentor_logged_in?
    redirect_to student_path(@current_user) unless !session[:mentor_id].nil?
  end

  def student_logged_in?
    redirect_to mentor_path(@current_user) unless !session[:student_id].nil?
  end

  def student_or_mentor_path(user)
    if session[:mentor_id]
      mentor_path(user)
    elsif session[:student_id]
      student_path(user)
    end
  end

  def student_or_mentor_resources_path(user)
    if session[:mentor_id]
      mentor_resource_path(user)
    elsif session[:student_id]
      student_resource_path(user)
    end
  end

  def find_mentor
    @mentor = Mentor.find_by_id(params[:mentor_id])
  end

end
