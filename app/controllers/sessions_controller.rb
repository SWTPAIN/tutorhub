class SessionsController < ApplicationController


  def create

    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # render json: { user: user, authorized: true }
      render json: { user: user, success: true}
    else
      render status: 400,
             json: {
                 error_message: 'Email or password is incorrect', authorized: false
             }
    end

  end

end
