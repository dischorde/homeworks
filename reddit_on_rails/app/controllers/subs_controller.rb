class SubsController < ApplicationController
  before_action :require_signed_in!, except: [:index, :show]
  before_action :find_sub, only: [:show, :edit, :update]
  before_action :require_ownership, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def show
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(subs_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @sub.update(subs_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private

  def find_sub
    @sub = Sub.find(params[:id])
  end

  def require_ownership
    return if current_user.subs.find_by(id: params[:id])
    render json: "Forbidden", status: :forbidden
  end

  def subs_params
    params.require(:sub).permit(:title, :description)
  end
end
