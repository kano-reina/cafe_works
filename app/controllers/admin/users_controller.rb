class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
    
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have successfully updated the account."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
end
