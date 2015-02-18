class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    render json: User.all, except: [:comments, :posts]
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
    render json: @user
  end

  def update
    @user.update(user_params)
    @user.save
    render json: @user
  end

  def destroy
    @user.destroy
    render json: {}
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :post_id, :comment_id)
  end
end
