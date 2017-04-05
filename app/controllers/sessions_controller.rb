class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to '/'
    end
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists and the password is correct
    if user && user.authenticate(params[:password])
      # Save the user id in a browser cookie.  This will persist while the user is logged in
      session[:user_id] = user.id
      redirect_to '/'
    else
      # Email/password incorrect
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end