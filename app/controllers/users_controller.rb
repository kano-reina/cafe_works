class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your account."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def withdraw
    @user = User.find(params[:id])
    if @user.update(user_params.merge(status: "withdrawn"))
      flash[:notice] = "You have successfully deleted your account."
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end 

  def user_params
    params.require(:user).permit(:profile_image, :name, :email, :status)
  end
  
end
