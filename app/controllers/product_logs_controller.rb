class ProductLogsController < ApplicationController
  before_action :set_product_log, only: %i[ show edit update destroy ]

  # GET /product_logs or /product_logs.json
  def index
    @product_logs = ProductLog.all
  end

  # GET /product_logs/1 or /product_logs/1.json
  def show
  end

  # GET /product_logs/new
  def new
    @product_log = ProductLog.new
  end

  # GET /product_logs/1/edit
  def edit
  end

  # POST /product_logs or /product_logs.json
  def create
    @product_log = ProductLog.new(product_log_params)

    respond_to do |format|
      if @product_log.save
        format.html { redirect_to @product_log, notice: "Product log was successfully created." }
        format.json { render :show, status: :created, location: @product_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_logs/1 or /product_logs/1.json
  def update
    respond_to do |format|
      if @product_log.update(product_log_params)
        format.html { redirect_to @product_log, notice: "Product log was successfully updated." }
        format.json { render :show, status: :ok, location: @product_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_logs/1 or /product_logs/1.json
  def destroy
    @product_log.destroy!

    respond_to do |format|
      format.html { redirect_to product_logs_path, status: :see_other, notice: "Product log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_log
      @product_log = ProductLog.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_log_params
      params.expect(product_log: [ :product_id, :action ])
    end
end
