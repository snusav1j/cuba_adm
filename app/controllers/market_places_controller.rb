class MarketPlacesController < ApplicationController
  before_action :set_market_place, only: %i[ show edit update destroy ]

  def index
    @market_places = MarketPlace.all
  end

  def show
  end

  def new
    @market_place = MarketPlace.new
  end

  def edit
  end

  def create
    @market_places = MarketPlace.all
    @market_place = MarketPlace.new(market_place_params)
    @market_place = @market_place.save
    respond_to :js
  end

  def update
    respond_to do |format|
      if @market_place.update(market_place_params)
        format.html { redirect_to @market_place, notice: "Market place was successfully updated." }
        format.json { render :show, status: :ok, location: @market_place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @market_place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @market_place.destroy!

    respond_to do |format|
      format.html { redirect_to market_places_path, status: :see_other, notice: "Market place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_market_place
      @market_place = MarketPlace.find(params.expect(:id))
    end

    def market_place_params
      params.expect(market_place: [ :marketplace_name ])
    end
end
