class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  
  # GET /comments
  # GET /comments.json
  def index
    @comments = Post.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Post.new
  end

  # GET /comments/1/edit
  def edit
  end
  
  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    
    if @comment.save
      redirect_to @post, notice: "Comment was successfully posted."
    else
      redirect_to @post, alert: "Error creating comment. " + @comment.errors.full_messages.to_sentence
    end
  end

  ##################################################### 
  # THIS PORTION IS VOLATILE, CHECK IF IT WORKS FIRST #
  #####################################################
  
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @comment.update(post_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
    end

    def comment_params
      params.require(:comment).permit(:author, :body)
    end
  
end
