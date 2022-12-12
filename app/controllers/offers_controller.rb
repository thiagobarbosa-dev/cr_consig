class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]

  # GET /offers or /offers.json
  def index
    if params[:search].present?
      filtered = Offer.joins(:customer, offer_products: :product).
        where("customers.company_name ILIKE ? or products.active_ingredient ILIKE ? or products.name ILIKE ?", 
        "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").order(:id).group("offers.id")
    else
      filtered = Offer.order(:id).all
    end
    @pagy, @offers = pagy(filtered.all, items: 10)
  end

  # GET /offers/1 or /offers/1.json
  def show
    @offer_products = @offer.offer_products
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers or /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url, notice: "Offer was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:customer_id, :total, :user_id, :last_update_by_user, :contact, :phone_number)
    end

    def add_params
      params.require(:offer).permit(:customer_id, :total, :user_id, :last_update_by_user_id, :contact, :phone_number,
        :offer_products => [:product_id, :quantity, :price, :price_with_icms, 
          :shipping_value, :subtotal, :exchangeable, :shipping_type_id])
    end
end
