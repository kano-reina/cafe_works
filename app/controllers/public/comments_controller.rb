class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to cafe_path(@comment.cafe), notice: 'Comment was successfully created.'
    else
      redirect_to cafe_path(@comment.cafe), notice: 'Comment was not created.'
    end
  end
  
  def destroy
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
