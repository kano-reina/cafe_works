class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  private
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
  
end