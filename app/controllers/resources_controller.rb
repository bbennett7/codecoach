class ResourcesController < ApplicationController
  before_action :logged_in?
  before_action :current_user, only:[:index, :create, :show, :update]
  before_action :current_user_is_coach?, only:[:new, :create, :edit]
  before_action :resource, only:[:show, :edit, :update, :top_resource]
  before_action :current_user_route, only: [:index, :show, :edit]
  before_action :current_user_resource, only: [:show, :edit]

  def new
    @resource = Resource.new
  end

  def index
    @resources = []

    if @current_user.user_type == "coach"
      @resources = @current_user.resources
    elsif @current_user.user_type == "student"
      @resources = @current_user.coach.resources if @current_user.coach
    end

    unless @resources.empty?
      @priorities = @resources.select{ |resource| resource.priority }.sort_by{|resource| resource.language }

      @read_resources = @resources.select{ |resource| resource.read && !resource.priority }.sort_by{|resource| resource.language }

      @unread_resources = @resources.select{ |resource| !resource.read && !resource.priority }.sort_by{|resource| resource.language }
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
      render json: @resource, status: 201
    else
      render 'new'
    end
  end

  def show
    @resource = Resource.find_by_id(params[:id])
    respond_to do |format|
      format.json { render json: @resource.to_json }
      format.html { render :show }
    end
  end

  def update
    @resource.update(resource_params)
    @resource.save
    redirect_to user_resources_path(@current_user)
  end

  def top_resources
    @top_resources = Resource.top_resources

    respond_to do |format|
      format.json { render json: @top_resources.to_json }
      format.html { render :top_resources }
    end
  end

  def top_resource
    respond_to do |format|
      format.html { render :top_resource }
      format.json { render json: @resource.to_json }
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:website, :title, :url, :priority, :language_id, :subfield_id, :user_id, :read, :student_rating)
  end

  def resource
    @resource = Resource.find_by_id(params[:id])
  end
end
