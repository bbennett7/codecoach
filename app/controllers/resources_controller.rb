class ResourcesController < ApplicationController
  before_action :current_user
  before_action :resource, only:[:show, :edit, :update, :top_resource]
  before_action :logged_in?
  before_action :mentor_logged_in?, only: [:new, :create, :edit]

  def new
    @resource = Resource.new
  end

  def index
    @read_resources = @current_user.resources.select{ |resource| resource.read }.sort_by{|resource| resource.language }

    @unread_resources = @current_user.resources.select{ |resource| !resource.read }.sort_by{|resource| resource.language }

    @user_resources = @read_resources + @unread_resources

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @user_resources.to_json }
    end
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
      redirect_to mentor_resource_path(@current_user, @resource)
    else
      render 'new'
    end
  end

  def show
    @resource = Resource.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @resource.to_json }
    end

    @read_resources = @current_user.resources.select{ |resource| resource.read }.sort_by{|resource| resource.language }

    @unread_resources = @current_user.resources.select{ |resource| !resource.read }.sort_by{|resource| resource.language }

    @user_resources = @read_resources + @unread_resources
  end

  def top_resources
    @top_resources = Resource.top_resources
  end

  def top_resource
  end

  def edit
  end

  def update
    @resource.update(resource_params)

    redirect_to student_or_mentor_resources_path(@current_user)
  end

  private

  def resource_params
    params.require(:resource).permit(:website, :title, :url, :language_id, :subfield_id, :mentor_id, :read, :student_rating)
  end

  def resource
    @resource = Resource.find_by_id(params[:id])
  end
end
