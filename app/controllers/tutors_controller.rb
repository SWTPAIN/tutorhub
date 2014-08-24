
class TutorsController < ApplicationController

  def index
    @tutors =Tutor.all
  end

  def featured_tutors
    @featured_tutors = Tutor.where(featured: true)
  end

end
