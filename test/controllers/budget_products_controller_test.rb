require "test_helper"

class BudgetProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budget_product = budget_products(:one)
  end

  test "should get index" do
    get budget_products_url
    assert_response :success
  end

  test "should get new" do
    get new_budget_product_url
    assert_response :success
  end

  test "should create budget_product" do
    assert_difference("BudgetProduct.count") do
      post budget_products_url, params: { budget_product: { budget_id: @budget_product.budget_id, exchangeable: @budget_product.exchangeable, price: @budget_product.price, price_with_icms: @budget_product.price_with_icms, product_id: @budget_product.product_id, quantity: @budget_product.quantity, shipping_type_id: @budget_product.shipping_type_id, shipping_value: @budget_product.shipping_value, subtotal: @budget_product.subtotal } }
    end

    assert_redirected_to budget_product_url(BudgetProduct.last)
  end

  test "should show budget_product" do
    get budget_product_url(@budget_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_budget_product_url(@budget_product)
    assert_response :success
  end

  test "should update budget_product" do
    patch budget_product_url(@budget_product), params: { budget_product: { budget_id: @budget_product.budget_id, exchangeable: @budget_product.exchangeable, price: @budget_product.price, price_with_icms: @budget_product.price_with_icms, product_id: @budget_product.product_id, quantity: @budget_product.quantity, shipping_type_id: @budget_product.shipping_type_id, shipping_value: @budget_product.shipping_value, subtotal: @budget_product.subtotal } }
    assert_redirected_to budget_product_url(@budget_product)
  end

  test "should destroy budget_product" do
    assert_difference("BudgetProduct.count", -1) do
      delete budget_product_url(@budget_product)
    end

    assert_redirected_to budget_products_url
  end
end
