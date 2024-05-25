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
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :email)
  end
  
end
