class Public::CafesController < ApplicationController
  def new
    @cafe = Cafe.new
  end
  
  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      redirect_to root_path
      flash[:notice] = "You have added cafe successfully."
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      @cafes = Cafe.search_by_name_or_address(params[:query])
    else
      @cafes = Cafe.all
    end
  end

  def show
    @cafe = Cafe.find(params[:id])
    @reviews = Review.all
    @review = Review.find(params[:id])
  end
  
  def edit 
    @cafe = Cafe.find(params[:id])
  end
  
  def update
    @cafe = Cafe.find(params[:id])
    if @cafe.update!(cafe_params)
      flash[:notice] = "You have updated cafe successfully."
      redirect_to cafe_path(@cafe)
    else
      render :edit
    end
  end
  
  private
  def cafe_params
    params.require(:cafe).permit(:name, :address, :has_power_outlet, :chat_meeting_ok, :has_wifi, :opening_hours, :introduction)
  end
  
end
