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

  def upload
    @user = User.find(params[:id])
    if params[:user] != nil
      files = params[:user][:files]

      File.open(Rails.root.join('public', 'uploads', files.original_filename), 'wb') do |file|
        file.write(files.read)
        upload = Upload.new(:filename => files.original_filename, :user_id => @user.id)
        upload.save
      end
    end

    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end