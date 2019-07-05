class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end

  def current_user_is_coach?
    true if current_user.user_type == "coach"
  end

  def current_user_is_student?
    true if current_user.user_type == "student"
  end

  def logged_in?
    if session[:user_id].nil?
      redirect_to root_path
    else
      redirect_to user_path(@current_user)
    end
  end

  def logged_out?
    !!session[:user_id].nil?
  end
end
