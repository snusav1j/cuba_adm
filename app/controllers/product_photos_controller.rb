class ProductPhotosController < ApplicationController
  before_action :set_product_photo, only: %i[ show edit update destroy ]

  # GET /product_photos or /product_photos.json
  def index
    @product_photos = ProductPhoto.all
  end

  # GET /product_photos/1 or /product_photos/1.json
  def show
  end

  # GET /product_photos/new
  def new
    @product_photo = ProductPhoto.new
  end

  # GET /product_photos/1/edit
  def edit
  end

  # POST /product_photos or /product_photos.json
  def create
    @product_photo = ProductPhoto.new(product_photo_params)

    respond_to do |format|
      if @product_photo.save
        format.html { redirect_to @product_photo, notice: "Product photo was successfully created." }
        format.json { render :show, status: :created, location: @product_photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_photos/1 or /product_photos/1.json
  def update
    respond_to do |format|
      if @product_photo.update(product_photo_params)
        format.html { redirect_to @product_photo, notice: "Product photo was successfully updated." }
        format.json { render :show, status: :ok, location: @product_photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_photos/1 or /product_photos/1.json
  def destroy
    @product_photo.destroy!

    respond_to do |format|
      format.html { redirect_to product_photos_path, status: :see_other, notice: "Product photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_photo
      @product_photo = ProductPhoto.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_photo_params
      params.expect(product_photo: [ :product_id, :photo_name ])
    end
end
