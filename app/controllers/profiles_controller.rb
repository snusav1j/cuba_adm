class ProfilesController < ApplicationController
  before_action :ensure_current_user
  
  def index
    # User.delete_all
    @users = User.all
  end

  def test
    
    respond_to :js
  end
end
