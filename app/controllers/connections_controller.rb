class ConnectionsController < ApplicationController
  before_action :current_user

  def create
    @connection = Connection.new(connection_params)
    debugger 
    if @connection.save
      redirect_to user_path(@current_user)
    else
      redirect_to find_a_coach_path
    end
  end

  private

  def connection_params
    params.require(:connection).permit(:coach_user_id, :student_user_id)
  end

  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end
end
