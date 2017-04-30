class CommentsController < ApplicationController
  before_action :ensure_signed_in

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to new_post_comment_url(@comment.post_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :user_id, :post_id, :parent_comment_id, sub_ids:[])
  end

end
