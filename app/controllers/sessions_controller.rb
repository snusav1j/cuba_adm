class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(login: user_params[:login])
    if @user && @user.password == user_params[:password]
      session[:user_id] = @user.id
      SuperLog.create_user_login_log(@user.id)
      # AutorizationLog.create_log(@user)
      redirect_to root_path
    else
      redirect_to new_user_path
      session[:user_id].clear if session[:user_id].present?
    end
  end

  def logout
    SuperLog.create_user_logout_log(session[:user_id])
    session.delete(:user_id)
    redirect_to new_user_path
  end

  private

  def user_params
    params.expect(user: [:login, :password])
  end
end
