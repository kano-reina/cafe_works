class CafesController < ApplicationController
  def new
    @cafe = Cafe.new
  end
  
  def create
    @cafe.post
  end

  def index
  end

  def show
  end

  def edit
  end
end
