class CommentsController < ApplicationController
  before_filter :authorize

  before_action :set_comment, only: [:edit, :update, :destroy]

  # GET /comments/new
  def new
    @comment = Post.new
  end

  # GET /comments/1/edit
  def edit
    # Handled by before_action
  end

  # POST /comments
  def create
    post = Post.find(params[:post_id])
    if current_user.courses.exists?(post.course)
      comment = post.comments.new(comment_params)
      comment.user_id = current_user.id

      if comment.save
        redirect_to course_post_path(post.course, post), notice: "Comment was successfully posted."
      else
        redirect_to post, alert: "Error creating comment. " + comment.errors.full_messages.to_sentence
      end
    else
      redirect_to redirect_to course_post_path(post.course, post)
    end
  end

  # PATCH/PUT /comments/1
  def update
    if current_user.id == @comment.user_id
      if @comment.update(comment_params)
        redirect_to course_post_path(@comment.post.course, @comment.post), notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to course_post_path(@comment.post.course, @comment.post)
    end
  end

  # DELETE /comments/1
  def destroy
    post = @comment.post
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to course_post_path(post.course, post), notice: 'Comment was successfully deleted.'
    else
      redirect_to course_post_path(post.course, post)
    end
  end

  # UPVOTE /comments/1/upvote
  def upvote
    # TODO
  end

  # DOWNVOTE /comments/1/downvote
  def downvote
    # TODO
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
    @breadcrumbs = [
        Breadcrumb.new(@comment.post.course.title, course_path(@comment.post.course)),
        Breadcrumb.new(@comment.post.title, course_post_path(@comment.post.course, @comment.post))
    ]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
