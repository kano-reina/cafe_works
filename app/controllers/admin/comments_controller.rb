class Admin::CommentsController < ApplicationController
  def destroy
    cafe = Cafe.find(params[:cafe_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to admin_cafe_path(cafe)
  end
end
