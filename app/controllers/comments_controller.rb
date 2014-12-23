class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post, notice: "Comment created succesfully"
    else
      redirect_to new_comment_post(@post), alert: "Comments cannot be blank"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:description)
    end

end
