class PostsController < ApplicationController
  before_action :require_signed_in!, except: [:show]
  before_action :find_post, except: [:new, :create]
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

  def downvote
    vote(-1)
  end

  def upvote
    vote(1)
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

  def vote(val)
    @user_vote = @post.votes.find_or_initialize_by(user: current_user)

    unless @user_vote.update(value: val)
      flash[:errors] = @user_vote.errors.full_messages
    end

    redirect_to post_url(@post)
  end
end
