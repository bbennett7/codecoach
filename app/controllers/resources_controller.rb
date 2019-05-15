class ResourcesController < ApplicationController
  def index
    
  end

  def new
    @resource = Resource.new
  end

  def create
    if !Subfield.find_by_id(id: resource_params[:subfield_id])
      subfield = Subfield.create(name: resource_params[:subfield_id], language_id: resource_params[:language_id])

      params[:resource][:subfield_id] = subfield.id
    end

    @resource = Resource.new(resource_params)
    @resource.save

    redirect_to mentor_resource_path(@resource.mentor, @resource)
  end

  def show
    @resource = Resource.find_by_id(params[:id])
  end

  private

  def resource_params
    params.require(:resource).permit(:website, :title, :url, :language_id, :subfield_id, :mentor_id)
  end
end
