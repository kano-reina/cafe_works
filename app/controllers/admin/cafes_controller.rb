class Admin::CafesController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!
  
  def index
    if params[:query].present?
      @cafes = Cafe.search_by_name_or_address(params[:query])
    else
      @cafes = Cafe.all
    end
  end
  
  def show
    @cafe = Cafe.find(params[:id])
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
    @cafe = Cafe.find(params[:id])
    cafe.destroy
    redirect_to admin_cafes_path
  end
  
  private
  def cafe_params
    params.require(:cafe).permit(:name, :address, :has_power_outlet, :chat_meeting_ok, :has_wifi, :opening_hours, :introduction)
  end
    
end
