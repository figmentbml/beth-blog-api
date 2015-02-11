class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    searched = params[:find]
    if searched
      @filtered = Post.where("title LIKE ? OR body LIKE ?", "%#{searched}%", "%#{searched}%")

      render json: @filtered, except: [:comments]
    else
      render json: Post.all, except: [:comments]
    end
  end

  def show
    render json: Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save
    render json: @post
  end

  def update
    @post.update(post_params)
    @post.save
    render json: @post
  end

  def destroy
    @post.destroy
    render json: {}
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :comment_id)
  end
end
