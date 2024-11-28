class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :ensure_current_user
  require 'fileutils'

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit_modal
    user_id = params[:user_id]
    @user = User.find_by(id: user_id)
    respond_to :js
  end

  def delete_user
    @user = User.find_by(id: params[:id])
    @deleted = @user.delete if @user
    if @deleted
      ProfilePhoto.find_by(user_id: @user.id).delete if ProfilePhoto.find_by(user_id: @user.id)
      FileUtils.remove_dir "#{Rails.root}/public/files/profile_imgs/#{@user.id}", true
    end
    respond_to :js
  end

  def create
    @users = User.all
    @can_create = !User.find_by(login: user_params[:login]).present?
    if @can_create
      @user = User.new(user_params)
      @user.save
    end
    respond_to :js
  end

  def update
    @users = User.all
    @updated = @user.update(user_params)

    respond_to :js
  end

  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params.expect(:id))
    end

    def user_params
      params.expect(user: [ :firstname, :lastname, :role, :email, :login, :password, :role, :id ])
    end
end
