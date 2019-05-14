class ApplicationController < ActionController::Base
  def logout
    reset_session
    redirect_to root_path
  end
end
