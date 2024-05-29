class Public::ReviewsController < ApplicationController
  before_action :set_cafe
  
  def new
    @review = Review.new
  end
  
  def create
    @review = @cafe.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to cafe_path(@cafe), notice: 'Review was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end

  private
  def set_cafe
    @cafe = Cafe.find(params[:cafe_id])
  end
  
  def review_params
    params.require(:review).permit(:rating, :body, :image)
  end
end