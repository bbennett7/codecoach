class ResourcesController < ApplicationController


  private

  def resource_params
    params.require(:resource).permit(:name, :mentor_id)
  end
end
