class TasksController < ApplicationController
  before_action :ensure_current_user
  
  def index
    @asd = 12312
  end

  private

end