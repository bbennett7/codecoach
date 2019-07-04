class ResourcesController < ApplicationController
  # before_action :current_user
  # before_action :resource, only:[:show, :edit, :update, :top_resource]
  # before_action :logged_in?
  #
  def new
    @resource = Resource.new
  end
  #
  # def index
  #   @read_resources = @current_user.resources.select{ |resource| resource.read }.sort_by{|resource| resource.language }
  #
  #   @unread_resources = @current_user.resources.select{ |resource| !resource.read }.sort_by{|resource| resource.language }
  # end

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

  # def show
  #   @resource = Resource.find(params[:id])
  #   respond_to do |format|
  #     format.json { render json: @resource.to_json }
  #     format.html { render :show }
  #   end
  # end
  #
  # def top_resources
  #   @top_resources = Resource.top_resources
  #
  #   respond_to do |format|
  #     format.json { render json: @top_resources.to_json }
  #     format.html { render :top_resources }
  #   end
  # end
  #
  # def top_resource
  #   respond_to do |format|
  #     format.html { render :top_resource }
  #     format.json { render json: @resource.to_json }
  #   end
  # end
  #
  # def edit
  # end
  #
  # def update
  #   @resource.update(resource_params)
  #
  #   redirect_to user_resources_path(@current_user)
  # end
  #
  # private
  #
  # def resource_params
  #   params.require(:resource).permit(:website, :title, :url, :language_id, :subfield_id, :mentor_id, :read, :student_rating)
  # end
  #
  # def resource
  #   @resource = Resource.find_by_id(params[:id])
  # end
end
