class TutorsController < ApplicationController

  def index
    @tutors = Tutor.where(featured: true)

  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      render :show, status: 201
    else
      render json: {message: 'Invalid Input'}, status: 400
    end
  end

  private

  def tutor_params
    params.require(:tutor).permit(:email, :name, :password, :password_confirmation, :description,
                                  :education_level, :institute, :gender)
  end

end
