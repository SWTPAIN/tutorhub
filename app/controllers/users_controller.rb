class UsersController < ApplicationController

  def create
    #creating Tutor or Employer depends on incoming user json object
    if params[:user][:subjects]

      @tutor = Tutor.new(tutor_params)
      if @tutor.save
        @tutor.subjects = (params[:user][:subjects])
        render json: { success: true, user: @tutor }, status: 201
      else
        render json: { success: false, message: 'Invalid Input'}, status: 400
      end
    else
      @employer = Employer.new(employer_params)
      if @employer.save
        render json: { success: true, user: @employer }, status: 201
      else
        render json: { success: false, message: 'Invalid Input'}, status: 400
      end
    end
  end

  private

  def tutor_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :description,
                                  :education_level, :institute, :gender)
  end

  def employer_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
