class BudgetProductsController < ApplicationController
  before_action :set_budget
  before_action :set_budget_product, only: %i[ edit update destroy ]

  # GET /budget_products/new
  def new
    @budget_product = @budget.budget_products.build
  end

  # GET /budget_products/1/edit
  def edit
  end

  # POST /budget_products or /budget_products.json
  def create
    @budget_product = @budget.budget_products.build(budget_product_params)

    if @budget_product.save
      respond_to do |format|
        format.html { redirect_to budget_path(@budget), notice: "Budget product was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Budget product was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /budget_products/1 or /budget_products/1.json
  def update
    if @budget_product.update(budget_product_params)
      respond_to do |format|
        format.html { redirect_to budget_path(@budget), notice: "Budget product was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Budget product was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /budget_products/1 or /budget_products/1.json
  def destroy
    @budget_product.destroy
    respond_to do |format|
      format.html { redirect_to budget_path(@budget), notice: "Budget product was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Budget product was successfully destroyed." }
    end
  end

  private

    def set_budget
      @budget = Budget.find(params[:budget_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_budget_product
      @budget_product = @budget.budget_product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_product_params
      params.require(:budget_product).permit(:budget_id, :product_id, :quantity, :price, :price_with_icms, :shipping_value, :subtotal, :exchangeable, :shipping_type_id)
    end
end
