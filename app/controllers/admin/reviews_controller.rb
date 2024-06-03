class Admin::ReviewsController < ApplicationController
  def destroy
    cafe = Cafe.find(params[:cafe_id])
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_cafe_path(cafe)
  end
end
