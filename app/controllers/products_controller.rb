class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]


  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def edit_modal
    product_id = params[:product_id]
    @product = Product.find_by(id: product_id)
    respond_to :js
  end

  def create
    @active_products = Product.get_active_products
    @products = Product.all
    @product = Product.new(product_params)
    @product.author_id = current_user.id
    @product.sold = Product::ACTIVE
    @saved = @product.save
    if @saved
      SuperLog.create_product_added_log(@product.id, current_user.id)
    end
    respond_to :js
  end

  def update
    @active_products = Product.get_active_products
    @products = Product.all
    @product.update(product_params)
    @product.sold = product_params[:available].to_i <= 0 ? Product::SOLD : Product::ACTIVE
    @updated = @product.save
    if @updated
      SuperLog.create_product_changed_log(@product.id, current_user.id)
    end
  end

  def sell_modal
    @sell_product = Product.find_by(id: params[:product_id])
  end
  
  def sell
    @products = Product.all
    @sell_product = Product.find_by(id: params[:product_id])
    sell_price = params[:sell_price]
    sell_count = params[:sell_count]
    new_available_count = @sell_product.available.to_i - sell_count.to_i
    @can_sold = @sell_product.available.to_i > 0
    @enough_count = @sell_product.available.to_i >= sell_count.to_i
    if @can_sold
      if @enough_count
        sell_count.to_i.times do |sell|
          @sold = SellProduct.sell_product(@sell_product.id, sell_price, current_user.id)
          SuperLog.create_product_sold_log(@sell_product.id, current_user.id)
        end
        sold = @sell_product.available.to_i - sell_count.to_i == 0 ? Product::SOLD : Product::ACTIVE
        @sell_product.update(available: new_available_count, sell_price: sell_price, sold: sold)
      end
    end
  end

  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params.expect(:id))
    end

    def product_params
      # params.require(:product).permit(:product_name, :description, :author_id, :available, :marketplace, :buy_price, :sold, :sell_price, :desired_price)
      params.expect(product: [ :product_name, :description, :author_id, :available, :marketplace, :buy_price, :sold, :sell_price, :desired_price ])
    end
end
