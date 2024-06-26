class Public::CafesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def new
    @cafe = Cafe.new
  end
  
  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      redirect_to cafes_path
      flash[:notice] = "You have added cafe successfully."
    else
      render :new
    end
  end
  
  def index
    if params[:query].present?
      @cafes = Cafe.search_by_name_or_address(params[:query]).page(params[:page])
    elsif params[:category].present?
      @cafes = Cafe.filter_by_category(params[:category]).page(params[:page])
    elsif params[:tag].present?
      @cafes = Cafe.joins(:tags).where(tags: { name: params[:tag] }).page(params[:page])
    else
      @cafes = Cafe.page(params[:page])
    end
  end

  def show
    @cafe = Cafe.find(params[:id])
    @average_rating = @cafe.average_rating
    @comment = Comment.new
  end
  
  def edit 
    @cafe = Cafe.find(params[:id])
    @cafe.tag_list = @cafe.tags.map(&:name).join(', ')
  end
  
  def update
    @cafe = Cafe.find(params[:id])
    if @cafe.update(cafe_params)
      flash[:notice] = "You have updated cafe successfully."
      redirect_to cafe_path(@cafe)
    else
      render :edit
    end
  end
  
  private
  def cafe_params
    params.require(:cafe).permit(:name, :address, :has_power_outlet, :chat_meeting_ok, :has_wifi, :opening_hours, :introduction, :tag_list)
  end
  
end