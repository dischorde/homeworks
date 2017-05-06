class UsersController < ApplicationController
  before_action :find_user, except: [:index, :create]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :updated
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user.destroy
    render json: @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
