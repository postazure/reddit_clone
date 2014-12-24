class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :ownership_control, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "Post created succesfully"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated succesfully"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post deleted succesfully"
  end

  private
    def post_params
      params.require(:post).permit(:title, :description)
    end

    def ownership_control
      @post = Post.find_by(id: params[:id], user_id: current_user)
      if @post.nil? && !current_user.is_moderator
        redirect_to root_path, alert: "That post does not belong to you!"
      end
    end
end
