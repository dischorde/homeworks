class CommentsController < ApplicationController
  before_action :require_signed_in!, only: [:new, :create]
  before_action :find_comment, except: [:new, :create]

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
    @new_comment = Comment.new(parent_comment_id: @comment.id)
    render :show
  end

  def upvote
    vote(1)
  end

  def downvote
    vote(-1)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :parent_comment_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def vote(val)
    @user_vote = @comment.votes.find_or_initialize_by(user: current_user)

    unless @user_vote.update(value: val)
      flash[:errors] = @user_vote.errors.full_messages
    end

    redirect_to comment_url(@comment)
  end
end
