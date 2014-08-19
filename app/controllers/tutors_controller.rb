class Tutors < ApplicationController

  def index
    @tutors = Tutor.where(featured: true)

  end



end
