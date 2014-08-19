class TutorsController < ApplicationController

  def index
    @featured_tutors = Tutor.where(feature: true)
  end

end
