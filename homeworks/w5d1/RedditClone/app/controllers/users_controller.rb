class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      login(user)
      redirect_to subs_url
    else
      flash.now[:errors] = ['Invalid user']
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
