class UsersController < ApplicationController

  def index
    render json: User.all, except: [:comments, :posts]
  end

  def show
    render json: User.find(params[:id]), except: [:posts]
  end
end
