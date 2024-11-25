class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(login: user_params[:login])
    if @user && @user.password == user_params[:password]
      session[:user_id] = @user.id
      AutorizationLog.create_log(@user)
      redirect_to root_path
    else
      redirect_to "/login"
      session[:user_id].clear if session[:user_id].present?
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to "/login"
  end

  private

  def user_params
    params.expect(user: [:login, :password])
  end
end
