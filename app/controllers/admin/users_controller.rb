class Admin::UsersController < ApplicationController
  layout 'admin'
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    combined_items = (@user.reviews + @user.bookmarks).sort_by { |item| item.created_at }.reverse
    @paginated_items = Kaminari.paginate_array(combined_items).page(params[:page]).per(5)
  end
    
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have successfully updated the account."
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :email)
  end
  
end
