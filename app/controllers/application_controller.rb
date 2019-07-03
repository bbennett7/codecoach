class ApplicationController < ActionController::Base
  #
  #
  # def index
  #   logged_out?
  # end
  #
  # private
  #
  # def logged_in?
  #   if session[:user_id].nil?
  #     redirect_to root_path
  #   else
  #     redirect_to user_path(@current_user)
  #   end
  # end
  #
  # def logged_out?
  #   true if logged_in? == false
  # end

  
  # # def student_or_mentor_path(user)
  # #   if session[:mentor_id]
  # #     mentor_path(user)
  # #   elsif session[:student_id]
  # #     student_path(user)
  # #   end
  # # end
  # #
  # # def student_or_mentor_resources_path(user)
  # #   if session[:mentor_id]
  # #     mentor_resources_path(user)
  # #   elsif session[:student_id]
  # #     student_resources_path(user)
  # #   end
  # # end
  # #
  # # def student_or_mentor_resource_path(user, resource)
  # #   if session[:mentor_id]
  # #     mentor_resource_path(user, resource)
  # #   elsif session[:student_id]
  # #     student_resource_path(user, resource)
  # #   end
  # # end
  #
  # def find_mentor
  #   @mentor = Mentor.find_by_id(params[:mentor_id])
  # end
end
