class SuperLogsController < ApplicationController
  before_action :set_super_log, only: %i[ show edit update destroy ]

  # GET /super_logs or /super_logs.json
  def index
    @super_logs = SuperLog.all
  end

  # GET /super_logs/1 or /super_logs/1.json
  def show
  end

  # GET /super_logs/new
  def new
    @super_log = SuperLog.new
  end

  # GET /super_logs/1/edit
  def edit
  end

  # POST /super_logs or /super_logs.json
  def create
    @super_log = SuperLog.new(super_log_params)

    respond_to do |format|
      if @super_log.save
        format.html { redirect_to @super_log, notice: "Super log was successfully created." }
        format.json { render :show, status: :created, location: @super_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @super_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /super_logs/1 or /super_logs/1.json
  def update
    respond_to do |format|
      if @super_log.update(super_log_params)
        format.html { redirect_to @super_log, notice: "Super log was successfully updated." }
        format.json { render :show, status: :ok, location: @super_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @super_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_logs/1 or /super_logs/1.json
  def destroy
    @super_log.destroy!

    respond_to do |format|
      format.html { redirect_to super_logs_path, status: :see_other, notice: "Super log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_super_log
      @super_log = SuperLog.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def super_log_params
      params.expect(super_log: [ :log_id, :user_id, :action, :log_type ])
    end
end
