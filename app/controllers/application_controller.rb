class ApplicationController < ActionController::Base
 before_action :logged_out?, only:[:root]

  private

# returns currently logged in user
  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end

# returns true if current user is a coach, redirects to user home if false
  def current_user_is_coach?
    if current_user.user_type == "coach"
      true
    else
      redirect_to user_path(@current_user)
    end
  end

#returns true if current user is a student, redirects to user home if false
  def current_user_is_student?
    if current_user.user_type == "student"
      true
    else
      redirect_to user_path(@current_user)
    end
  end

# validates if profile page requested belongs to user or associated user
  def current_user_route
    if params[:id] && current_user.id == params[:id].to_i
      true
    elsif params[:id] && current_user.id != params[:id].to_i
      redirect_to user_path(@current_user)
    else
      redirect_to root_path
    end
  end

# validates if resource page requested belongs to user or associated user
  def current_user_resource
    resource = Resource.find_by_id(params[:id].to_i)
    if current_user.user_type == "student" && current_user.coach.nil?
      redirect_to user_path(@current_user)
    elsif current_user.id == resource.user_id || current_user.coach.id == resource.user_id
      true
    else
      redirect_to user_path(@current_user)
    end
  end

# validates if a user is logged_in, reroutes to root_path if not
  def logged_in?
    if session[:user_id].nil?
      redirect_to root_path
    else
      true
    end
  end

# validates if a user is logged_in, reroutes to home_page if so
  def logged_out?
    if session[:user_id]
      redirect_to user_path(current_user)
    else
      true
    end
  end
end
