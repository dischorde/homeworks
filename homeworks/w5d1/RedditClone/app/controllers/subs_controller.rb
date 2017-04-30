class SubsController < ApplicationController
  before_action :ensure_moderator, only: [:edit, :update]
  before_action :ensure_signed_in

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = ['Error creating sub']
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = ['Error updating sub']
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def ensure_moderator
    @sub = Sub.find(params[:id])
    @sub.moderator == current_user
  end
end
