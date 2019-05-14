class MentorsController < ApplicationController
  def new
    @mentor = Mentor.new
  end
end
