require "application_system_test_case"

class BudgetProductsTest < ApplicationSystemTestCase
  setup do
    @budget_product = budget_products(:one)
  end

  test "visiting the index" do
    visit budget_products_url
    assert_selector "h1", text: "Budget products"
  end

  test "should create budget product" do
    visit budget_products_url
    click_on "New budget product"

    fill_in "Budget", with: @budget_product.budget_id
    check "Exchangeable" if @budget_product.exchangeable
    fill_in "Price", with: @budget_product.price
    fill_in "Price with icms", with: @budget_product.price_with_icms
    fill_in "Product", with: @budget_product.product_id
    fill_in "Quantity", with: @budget_product.quantity
    fill_in "Shipping type", with: @budget_product.shipping_type_id
    fill_in "Shipping value", with: @budget_product.shipping_value
    fill_in "Subtotal", with: @budget_product.subtotal
    click_on "Create Budget product"

    assert_text "Budget product was successfully created"
    click_on "Back"
  end

  test "should update Budget product" do
    visit budget_product_url(@budget_product)
    click_on "Edit this budget product", match: :first

    fill_in "Budget", with: @budget_product.budget_id
    check "Exchangeable" if @budget_product.exchangeable
    fill_in "Price", with: @budget_product.price
    fill_in "Price with icms", with: @budget_product.price_with_icms
    fill_in "Product", with: @budget_product.product_id
    fill_in "Quantity", with: @budget_product.quantity
    fill_in "Shipping type", with: @budget_product.shipping_type_id
    fill_in "Shipping value", with: @budget_product.shipping_value
    fill_in "Subtotal", with: @budget_product.subtotal
    click_on "Update Budget product"

    assert_text "Budget product was successfully updated"
    click_on "Back"
  end

  test "should destroy Budget product" do
    visit budget_product_url(@budget_product)
    click_on "Destroy this budget product", match: :first

    assert_text "Budget product was successfully destroyed"
  end
end
