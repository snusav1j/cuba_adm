class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :ensure_current_user
  
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

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to "/profiles"
  end

  def update
    @updated = @user.update(user_params)
    redirect_to "/profiles"
    # respond_to :js
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
      params.expect(user: [ :firstname, :lastname, :role, :email, :login, :password, :role ])
    end
end
