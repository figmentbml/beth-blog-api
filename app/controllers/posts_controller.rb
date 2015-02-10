class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    searched = params[:find]
    if searched
      @filtered = Post.where("title LIKE ? OR body LIKE ?", "%#{searched}%", "%#{searched}%")

      render json: @filtered, except: [:comments, :users]
    else
      render json: Post.all, except: [:comments, :users]
    end
  end

  def show
    render json: Post.find(params[:id]), except: [:posts]
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :comment_id)
  end
end
