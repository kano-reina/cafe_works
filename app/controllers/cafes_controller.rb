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
    
    tag = Tag.new(tag_params)
    tag.cafe_id = cafe.id
    
  end

  def index
  end

  def show
  end
  
  private
  def cafe_params
    params.require(:cafe).permit(:name, :address, :city)
  end
  
  def tag_params
    params.require(:tag).permit(:has_power_outlet, :is_conversation_allowed, :has_wifi)
  end
  
end
