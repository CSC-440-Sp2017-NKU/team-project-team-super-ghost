class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_path
    end
    @errors = []
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists and the password is correct
    if user && user.authenticate(params[:password])
      # Save the user id in a browser cookie.  This will persist while the user is logged in
      session[:user_id] = user.id
      redirect_to root_path
    #else
      #redirect_to new_sessions_path
    end
    @errors = ['Invalid username or password.']
    # Email/password incorrect
  end

  def destroy
    reset_session
    redirect_to new_sessions_path
  end
end