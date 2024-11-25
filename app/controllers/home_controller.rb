class HomeController < ApplicationController
  before_action :ensure_current_user
  
  def index
    respond_to do |format|
      format.html
      format.js
    end
  end
end
