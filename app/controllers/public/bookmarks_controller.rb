class Public::BookmarksController < ApplicationController
  before_action :set_cafe
  
  def create
    bookmark = current_user.bookmarks.new(cafe_id: @cafe.id)
    bookmark.save
    redirect_to cafe_path(@cafe), notice: 'The cafe has been successfully bookmarked.'
  end
  
  def destroy
    bookmark = current_user.bookmarks.find_by(cafe_id: @cafe.id)
    bookmark.destroy
    redirect_to cafe_path(@cafe), notice: 'The bookmark has been successfully removed.'
  end
  
  private
  def set_cafe
    @cafe = Cafe.find(params[:cafe_id])
  end
end
