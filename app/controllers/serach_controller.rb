class SearchController < ApplicationController

  def index
    if jump = find_jump_target(params[:query])
      redirect_to jump
    else
    Case.search(params[:query])
    end
  end


  private

    def find_jump_target(keyword)
      Tutor.find_by(name: keyword)
    end
end
