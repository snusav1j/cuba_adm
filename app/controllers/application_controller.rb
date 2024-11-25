class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user
  before_action :set_global_vars

  def set_global_vars
    @cur_url = request.env['REQUEST_URI']
		@ref_url = request.env['HTTP_REFERER']
  end

  def ensure_current_user
    if current_user.nil?
      redirect_to '/login'
    end
  end

  def current_page
    
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

end
