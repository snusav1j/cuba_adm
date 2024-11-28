class SellProductsController < ApplicationController
  before_action :set_sell_product, only: %i[ show edit update destroy ]

  # GET /sell_products or /sell_products.json
  def index
    @sell_products = SellProduct.all
  end

  # GET /sell_products/1 or /sell_products/1.json
  def show
  end

  # GET /sell_products/new
  def new
    @sell_product = SellProduct.new
  end

  # GET /sell_products/1/edit
  def edit
  end

  # POST /sell_products or /sell_products.json
  def create
    @sell_product = SellProduct.new(sell_product_params)

    respond_to do |format|
      if @sell_product.save
        format.html { redirect_to @sell_product, notice: "Sell product was successfully created." }
        format.json { render :show, status: :created, location: @sell_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sell_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sell_products/1 or /sell_products/1.json
  def update
    respond_to do |format|
      if @sell_product.update(sell_product_params)
        format.html { redirect_to @sell_product, notice: "Sell product was successfully updated." }
        format.json { render :show, status: :ok, location: @sell_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sell_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sell_products/1 or /sell_products/1.json
  def destroy
    @sell_product.destroy!

    respond_to do |format|
      format.html { redirect_to sell_products_path, status: :see_other, notice: "Sell product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell_product
      @sell_product = SellProduct.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sell_product_params
      params.expect(sell_product: [ :product_id, :sell_price ])
    end
end
