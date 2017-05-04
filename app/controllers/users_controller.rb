class UsersController < ApplicationController
  @rep_bool = false
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 0
    if @user.save
#      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    @comments = @user.comments.order("created_at DESC")
  end
  
  def calculate_reputation
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
    post_upvotes = 0
    post_downvotes = 0
    @posts.each do |post|
      post_upvotes = post_upvotes + post.post_votes.upvote_count
      post_downvotes = post_downvotes + post.post_votes.downvote_count
    end
    comment_upvotes = 0
    comment_downvotes = 0
    @comments.each do |comment|
      comment_upvotes = comment_upvotes + comment.comment_votes.upvote_count
      comment_downvotes = comment_downvotes + comment.comment_votes.downvote_count
    end
    upvotes = post_upvotes + comment_upvotes
    downvotes = post_downvotes + comment_downvotes
    reputation = upvotes - downvotes
    
    if reputation >= 0
      @rep_bool = true
    else
      @rep_bool = false
    end
    return reputation
  end
  
  def rep_is_positive
    calculate_reputation
    return @rep_bool
  end
  
  helper_method :calculate_reputation
  helper_method :rep_is_positive
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