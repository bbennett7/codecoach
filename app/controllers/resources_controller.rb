class ResourcesController < ApplicationController
  def index
  end

  def new
    @resource = Resource.new
  end

  def create
    if !params[:resource][:subfield][:name].nil?
      subfield = Subfield.find_or_create_by(name: params[:resource][:subfield][:name].strip)
      subfield.language_id = params[:resource][:language_id]
      subfield.save

      params[:resource][:subfield_id] = subfield.id
    end

    @resource = Resource.new(resource_params)
    @resource.save

    redirect_to mentor_resource_path(@resource.mentor, @resource)
  end

  def top_resources
    @top_resources = Resource.top_resources
    @top_resources.compact!
  end

  def show
    @resource = Resource.find_by_id(params[:id])
  end

  def update
    @student = Student.find_by_id(session[:student_id])
    @resource = Resource.find_by_id(params[:id])
    @resource.update(resource_params)

    redirect_to mentor_resource_path(@student.mentor, @resource)
  end

  private

  def resource_params
    params.require(:resource).permit(:website, :title, :url, :language_id, :subfield_id, :mentor_id, :read, :student_rating)
  end
end
