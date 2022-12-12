class ShippingTypesController < ApplicationController
  before_action :set_shipping_type, only: %i[ show edit update destroy ]

  # GET /shipping_types or /shipping_types.json
  def index
    @shipping_types = ShippingType.all
  end

  # GET /shipping_types/1 or /shipping_types/1.json
  def show
  end

  # GET /shipping_types/new
  def new
    @shipping_type = ShippingType.new
  end

  # GET /shipping_types/1/edit
  def edit
  end

  # POST /shipping_types or /shipping_types.json
  def create
    @shipping_type = ShippingType.new(shipping_type_params)

    respond_to do |format|
      if @shipping_type.save
        format.html { redirect_to shipping_type_url(@shipping_type), notice: "Shipping type was successfully created." }
        format.json { render :show, status: :created, location: @shipping_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipping_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipping_types/1 or /shipping_types/1.json
  def update
    respond_to do |format|
      if @shipping_type.update(shipping_type_params)
        format.html { redirect_to shipping_type_url(@shipping_type), notice: "Shipping type was successfully updated." }
        format.json { render :show, status: :ok, location: @shipping_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipping_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_types/1 or /shipping_types/1.json
  def destroy
    @shipping_type.destroy

    respond_to do |format|
      format.html { redirect_to shipping_types_url, notice: "Shipping type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_type
      @shipping_type = ShippingType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipping_type_params
      params.require(:shipping_type).permit(:code, :name)
    end
end
