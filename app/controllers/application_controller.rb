class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end


  def current_user_is_coach?
    if current_user.user_type == "coach"
      true
    else
      redirect_to user_path(@current_user)
    end
  end


  def current_user_is_student?
    if current_user.user_type == "student"
      true
    else
      redirect_to user_path(@current_user)
    end
  end

  def current_user_route
    if params[:user_id]
      if current_user.id == params[:user_id].to_i
        true
      else
        redirect_to user_path(@current_user)
      end
    else
      if current_user.id == params[:id].to_i
        true
      else
        redirect_to user_path(@current_user)
      end
    end
  end

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


  def logged_in?
    if session[:user_id].nil?
      redirect_to root_path
    end
  end


  def logged_out?
    !!session[:user_id].nil?
  end
end
