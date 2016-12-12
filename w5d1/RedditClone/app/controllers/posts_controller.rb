class PostsController < ApplicationController
  before_action :ensure_author, only: [:edit, :update]
  before_action :ensure_signed_in

  def show
    @post = Post.find(params[:id])
    @top_comments = @post.comments.where(parent_comment_id: nil)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = ['Error creating post']
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = ['Error updating post']
    end
  end

  def destroy
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, sub_ids:[])
  end

  def ensure_author
    @post = Post.find(params[:id])
    @post.author == current_user
  end

end
