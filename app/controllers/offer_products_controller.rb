class OfferProductsController < ApplicationController
  before_action :set_offer
  before_action :set_offer_product, only: %i[ edit update destroy ]

  # GET /offer_products/new
  def new
    @offer_product = @offer.offer_products.build
  end

  # GET /offer_products/1/edit
  def edit
  end

  # POST /offer_products or /offer_products.json
  def create
    @offer_product = @offer.offer_products.build(offer_product_params)

    if @offer_product.save
      respond_to do |format|
        format.html { redirect_to offer_path(@offer), notice: "Offer product was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Offer product was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /offer_products/1 or /offer_products/1.json
  def update
    if @offer_product.update(offer_product_params)
      respond_to do |format|
        format.html { redirect_to offer_path(@offer), notice: "Offer product was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Offer product was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /offer_products/1 or /offer_products/1.json
  def destroy
    @offer_product.destroy
    respond_to do |format|
      format.html { redirect_to offer_path(@offer), notice: "Offer product was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Offer product was successfully destroyed." }
    end
  end

  private

    def set_offer
      @offer = Offer.find(params[:offer_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_offer_product
      @offer_product = @offer.offer_products.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_product_params
      params.require(:offer_product).permit(:offer_id, :product_id, :quantity, :price, :price_with_icms, :shipping_value, :subtotal, :exchangeable, :shipping_type_id)
    end
end
