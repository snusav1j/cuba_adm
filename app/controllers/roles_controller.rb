class RolesController < ApplicationController
  before_action :ensure_current_user
  
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def edit_modal
    role_id = params[:role_id]
    @role = Role.find_by(role_id)
    respond_to :js
  end

  def create
    @role = Role.new(role_params)
    @role.save
  end

  def update

  end

  private

  def role_params
    params.expect(role: [ :role_name ])

  end

end