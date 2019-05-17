class ResourcesController < ApplicationController
  def index
    @mentor = Mentor.find_by_id(params[:mentor_id])

    @resources = @mentor.resources.sort_by{|resource| resource.language }
  end

  def new
    @resource = Resource.new
  end

  def create
    if !params[:resource][:subfield][:name].empty?
      subfield = Subfield.find_or_create_by(name: params[:resource][:subfield][:name].strip)
      subfield.language_id = params[:resource][:language_id]
      subfield.save

      params[:resource][:subfield_id] = subfield.id
    end

    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to mentor_resource_path(@resource.mentor, @resource)
    else
      render 'new'
    end
  end

  def top_resources
    @top_resources = Resource.top_resources
  end

  def show
    @resource = Resource.find_by_id(params[:id])
  end

  def edit
    @resource = Resource.find_by_id(params[:id])
  end

  def update
    if session[:student_id]
      @student = Student.find_by_id(session[:student_id])
      @resource = Resource.find_by_id(params[:id])
      @resource.update(resource_params)

      redirect_to mentor_resources_path(@student.mentor)
    elsif session[:mentor_id]
      @mentor = Mentor.find_by_id(session[:mentor_id])
      @resource = Resource.find_by_id(params[:id])
      @resource.update(resource_params)

      redirect_to mentor_resources_path(@mentor)
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:website, :title, :url, :language_id, :subfield_id, :mentor_id, :read, :student_rating)
  end
end
