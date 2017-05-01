class PostsController < ApplicationController
  before_action :require_signed_in!, except: [:show]
  before_action :find_post, only: [:show, :edit, :update]
  before_action :require_ownership, only: [:edit, :update]

  def show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def require_ownership
    return if current_user.posts.find_by(id: params[:id])
    render json: "Forbidden", status: :forbidden
  end

  def post_params
    params.require(:post).permit(:url, :title, :content, sub_ids: [])
  end
end
