class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    render json: Comment.all
  end

  def show
    render json: Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    render json: @comment
  end

  def update
    @comment.update(comment_params)
    @comment.save
    render json: @comment
  end

  def destroy
    @comment.destroy
    render json: {}
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end

end
