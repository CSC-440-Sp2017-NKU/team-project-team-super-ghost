class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
  end
  
  def is_admin?
    @user = User.find(params[:id])
    @user.role==1
  end
  
  def is_registrar?
    @user = User.find(params[:id])
    @user.role==2
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end