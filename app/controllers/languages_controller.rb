class LanguagesController < ApplicationController
  # before_action :current_user
  # before_action :logged_in?
  #
  # def new_or_destroy
  #   @language = Language.new
  # end
  #
  # def create
  #   if params[:language][:name].empty? && params[:language][:id].empty?
  #     @language = Language.new(language_params)
  #
  #     render 'new_or_destroy'
  #   else
  #     if !language_params[:name].empty?
  #       @language = Language.find_or_create_by(name: language_params[:name])
  #     else
  #       @language = Language.find_by_id(params[:language][:id])
  #     end
  #     if @language.nil?
  #
  #       render 'new_or_destroy'
  #     else
  #       @current_user.languages << @language if !@current_user.languages.include?(@language)
  #
  #       redirect_to user_path(@current_user)
  #     end
  #   end
  # end
  #
  # def destroy
  #   @languages = params[:language][:id]
  #   @languages.delete("")
  #
  #   @languages.each do |lang_id|
  #     language = Language.find_by_id(lang_id)
  #     @current_user.languages.destroy(language)
  #   end
  #
  #   redirect_to user_path(@current_user)
  # end
  #
  # private
  #
  # def language_params
  #   params.require(:language).permit(:name)
  # end

end
