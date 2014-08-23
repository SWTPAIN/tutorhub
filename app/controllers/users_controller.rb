class UsersController < ApplicationController

  def create
    binding.pry
    #creating Tutor or Employer depends on incoming user json object
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      render :show, status: 201
    else
      render json: {message: 'Invalid Input'}, status: 400
    end
  end

  def tutor_params
    params.require(:tutor).permit(:email, :name, :password, :password_confirmation, :description,
                                  :education_level, :institute, :gender)
  end

end
