class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @review = Review.new
  end
  
  def create
    @cafe = Cafe.find(params[:id])
    @review = @cafe.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @cafe, notice: 'Review was successfully created.'
    else
      render :new
    end
  end
  
  def edit
  end

  private
  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
