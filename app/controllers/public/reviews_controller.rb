class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
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
    @review = Review.find(params[:id])
  end
  
  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      flash[:notice] = "You have updated review successfully."
      redirect_to cafe_path(@cafe)
    else
      render :edit
    end
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to cafe_path(@cafe)
  end
  
  private
  def set_cafe
    @cafe = Cafe.find(params[:cafe_id])
  end
  
  def review_params
    params.require(:review).permit(:rating, :body, :image)
  end
end