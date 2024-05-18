class PostsController < ApplicationController
  def new
    @cafe = Cafe.new
  end
  
  def create
    @cafe.post
    post = Post.new(post_params)
    post.save!
    
    
    
    feature = Feature.new(feature_params)
    feature.cafe_id = cafe.id
    
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private 
  
  def post_params
    params.require(:post).permit(:image, :name)
  end
  
  def cafe_params
    params.require(:post).permit(:name)
  end
  
  def feature_params
    params.require(:post).permit(:wifi, )
  end
end
