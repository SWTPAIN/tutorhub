class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      render json: { user: user, success: true}
    else
      render status: 400,
             json: {
                error_message: 'Email or password is incorrect',
                success: false
             }
    end
  end

  def destroy
    user = User.find(params[:id])
    if user && session[:user_id] == user.id
      session[:user_id] = nil
      render json: { success: true }
    else
      render status: 400,
             json: { success: false }
    end
  end

end
