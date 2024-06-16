class Admin::CafesController < ApplicationController
  layout 'admin' 
  
  def index
    if params[:query].present?
      @cafes = Cafe.search_by_name_or_address(params[:query]).page(params[:page])
    elsif params[:tag].present?
      @cafes = Cafe.joins(:tags).where(tags: { name: params[:tag] }).page(params[:page])
    else
      @cafes = Cafe.page(params[:page])
    end
  end
  
  def show
    @cafe = Cafe.find(params[:id])
    @average_rating = @cafe.average_rating
  end
  
  def edit
    @cafe = Cafe.find(params[:id])
  end
  
  def update
    @cafe = Cafe.find(params[:id])
    if @cafe.update(cafe_params)
      flash[:notice] = "You have updated cafe successfully."
      redirect_to admin_cafe_path(@cafe)
    else
      render :edit
    end
  end
  
  def destroy
    cafe = Cafe.find(params[:id])
    cafe.destroy
    redirect_to admin_cafes_path
  end
  
  private
  def cafe_params
    params.require(:cafe).permit(:name, :address, :has_power_outlet, :chat_meeting_ok, :has_wifi, :opening_hours, :introduction, :tag_list)
  end
    
end
