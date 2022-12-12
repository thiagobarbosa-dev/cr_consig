class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[ show edit update destroy ]

  # GET /budgets or /budgets.json
  def index
    if params[:search].present?
      filtered = Budget.joins(:customer, budget_products: :product).
        where("customers.company_name ILIKE ? or products.active_ingredient ILIKE ? or products.name ILIKE ?", 
        "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").order(:id).group("budgets.id")
    else
      filtered = Budget.order(:id).all
    end
    @pagy, @budgets = pagy(filtered.all, items: 10)
  end

  # GET /budgets/1 or /budgets/1.json
  def show
    @budget_products = @budget.budget_products
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets or /budgets.json
  def create
    @budget = Budget.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to budget_url(@budget), notice: "Budget was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1 or /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to budget_url(@budget), notice: "Budget was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1 or /budgets/1.json
  def destroy
    @budget.destroy

    respond_to do |format|
      format.html { redirect_to budgets_url, notice: "Budget was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_params
      params.require(:budget).permit(:customer_id, :subtotal, :user_id, :last_update_by_user, :contact, :phone_number)
    end

    def add_params
      params.require(:budget).permit(:customer_id, :total, :user_id, :last_update_by_user_id, :contact, :phone_number,
        :budget_products => [:product_id, :quantity, :price, :price_with_icms, 
          :shipping_value, :subtotal, :exchangeable, :shipping_type_id])
    end
end
