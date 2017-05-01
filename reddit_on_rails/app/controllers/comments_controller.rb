class CommentsController < ApplicationController
  before_action :require_signed_in!, only: [:new, :create]

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      fail
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_post_comment_url(@comment.post_id)
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @new_comment = Comment.new(parent_comment_id: @comment.id)

    render :show
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :parent_comment_id)
  end

end
