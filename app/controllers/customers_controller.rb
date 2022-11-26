class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    if params[:search].present?
      filtered = Customer.where("company_name ILIKE ? or trading_name ILIKE ? or ein_number ILIKE ?", 
        "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").order(:id).all
    else
      filtered = Customer.order(:id).all
    end
    @pagy, @customers = pagy(filtered.all, items: 10)
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        @customer.update(user_id: current_user.id, last_update_by_user_id: current_user.id)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        @customer.update(last_update_by_user_id: current_user.id)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def states
    @states = CS.states(params[:country]).invert ? CS.states(params[:country]).invert : []
    respond_to do |format|
      format.turbo_stream
    end
  end

  def cities
    @cities = CS.cities(params[:state]) ? CS.cities(params[:state]) : []
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:company_name, :trading_name, :ein_number, :state_tax_id, :municipal_tax_id, :street, :number, :complement, :zip_code, :main_email, :second_email, :third_email, :whatsapp_number, :main_phone_number, :second_phone_number, :country, :state, :city, :user_id, :last_user_modified)
    end
end
