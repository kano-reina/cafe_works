class CafesController < ApplicationController
  def new
    @cafe = Cafe.new
  end
  
  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      redirect_to root_path
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
  end
  
  private
  def cafe_params
    params.require(:cafe).permit(:name, :address, :has_power_outlet, :chat_meeting_ok, :has_wifi, :opening_hours, :introduction)
  end
  
end
