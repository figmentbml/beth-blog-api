class CommentsController < ApplicationController

  def index
    render json: Comment.all, except: [:users, :posts]
  end

  def show
    render json: Comment.find(params[:id])
  end
end
