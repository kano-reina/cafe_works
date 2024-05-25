class Admin::CafesController < ApplicationController
  layout 'admin' 
  before_action :authenticate_admin!
    def index
        @cafes = Cafe.all
    end
end
