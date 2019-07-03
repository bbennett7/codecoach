class LanguagesController < ApplicationController
   before_action :current_user
  # before_action :logged_in?
  #
  def new_or_destroy
    @language = Language.new
  end
  #
  def create
    if language_params[:name].empty? && language_params[:id].nil?
      redirect_to new_or_delete_language_path
    else
      if !language_params[:name].empty?
        @language = Language.find_or_create_by(name: language_params[:name])
      else
        @language = Language.find_by_id(language_params[:id])
      end

      if @language && !@current_user.languages.include?(@language)
        @current_user.languages << @language

        redirect_to user_path(@current_user)
      end
    end

  end
  
  def destroy
    @languages = params[:language][:id]
    @languages.delete("")

    @languages.each do |lang_id|
      language = Language.find_by_id(lang_id)
      @current_user.languages.destroy(language)
    end

    redirect_to user_path(@current_user)
  end

  private

  def language_params
    params.require(:language).permit(:name, :id)
  end

  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end

end
