class Public::ReviewCommentsController < ApplicationController
  def create
    comment = ReviewComment.find(params[])
  end
  
  private
  
  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
  
end
