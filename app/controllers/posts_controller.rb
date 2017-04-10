class PostsController < ApplicationController
  before_filter :authorize

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts/1
  def show
    # Handled by before_action
  end

  # GET /posts/new
  def new
    course = Course.find params[:course_id]
    @post = Post.new(:course => course)
  end

  # GET /posts/1/edit
  def edit
    # Handled by before_action
  end

  # POST /posts
  def create
    course = Course.find(params[:course_id])
    @post = course.posts.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to course_post_path(@post.course, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if current_user.id == @post.user_id
      if @post.update(post_params)
        redirect_to course_post_path(@post.course, @post), notice: 'Post was successfully updated.'
      else
        render :new
      end
    else
      redirect_to course_post_path(@post.course, @post)
    end
  end

  # DELETE /posts/1
  def destroy
    course = @post.course
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to course, notice: 'Post was successfully deleted.'
    else
      redirect_to course_post_path(course, @post)
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
    @breadcrumbs = [Breadcrumb.new(@post.course.title, course_path(@post.course))]
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
