class AutorizationLogsController < ApplicationController
  before_action :set_autorization_log, only: %i[ show edit update destroy ]

  # GET /autorization_logs or /autorization_logs.json
  def index
    @autorization_logs = AutorizationLog.all
  end

  # GET /autorization_logs/1 or /autorization_logs/1.json
  def show
  end

  # GET /autorization_logs/new
  def new
    @autorization_log = AutorizationLog.new
  end

  # GET /autorization_logs/1/edit
  def edit
  end

  # POST /autorization_logs or /autorization_logs.json
  def create
    @autorization_log = AutorizationLog.new(autorization_log_params)

    respond_to do |format|
      if @autorization_log.save
        format.html { redirect_to @autorization_log, notice: "Autorization log was successfully created." }
        format.json { render :show, status: :created, location: @autorization_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @autorization_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /autorization_logs/1 or /autorization_logs/1.json
  def update
    respond_to do |format|
      if @autorization_log.update(autorization_log_params)
        format.html { redirect_to @autorization_log, notice: "Autorization log was successfully updated." }
        format.json { render :show, status: :ok, location: @autorization_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @autorization_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autorization_logs/1 or /autorization_logs/1.json
  def destroy
    @autorization_log.destroy!

    respond_to do |format|
      format.html { redirect_to autorization_logs_path, status: :see_other, notice: "Autorization log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_autorization_log
      @autorization_log = AutorizationLog.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def autorization_log_params
      params.expect(autorization_log: [ :user_id ])
    end
end
