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
  end

  def show
  end
  
  private
  def cafe_params
    params.require(:cafe).permit(:name, :address, :city)
  end
  
end
