class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cafe
  before_action :set_review

  def create
    @comment = @review.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to cafe_path(@cafe), notice: 'Your comment has been successfully created.'
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to cafe_path(@cafe)
  end
  
  private
  def set_cafe
    @cafe = Cafe.find(params[:cafe_id])
  end
  
  def set_review
    @review = Review.find(params[:review_id])
  end
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
