require "application_system_test_case"

class OfferProductsTest < ApplicationSystemTestCase
  setup do
    @offer_product = offer_products(:one)
  end

  test "visiting the index" do
    visit offer_products_url
    assert_selector "h1", text: "Offer products"
  end

  test "should create offer product" do
    visit offer_products_url
    click_on "New offer product"

    check "Exchangeable" if @offer_product.exchangeable
    fill_in "Offer", with: @offer_product.offer_id
    fill_in "Price", with: @offer_product.price
    fill_in "Price with icms", with: @offer_product.price_with_icms
    fill_in "Product", with: @offer_product.product_id
    fill_in "Quantity", with: @offer_product.quantity
    fill_in "Shipping type", with: @offer_product.shipping_type_id
    fill_in "Shipping value", with: @offer_product.shipping_value
    fill_in "Subtotal", with: @offer_product.subtotal
    click_on "Create Offer product"

    assert_text "Offer product was successfully created"
    click_on "Back"
  end

  test "should update Offer product" do
    visit offer_product_url(@offer_product)
    click_on "Edit this offer product", match: :first

    check "Exchangeable" if @offer_product.exchangeable
    fill_in "Offer", with: @offer_product.offer_id
    fill_in "Price", with: @offer_product.price
    fill_in "Price with icms", with: @offer_product.price_with_icms
    fill_in "Product", with: @offer_product.product_id
    fill_in "Quantity", with: @offer_product.quantity
    fill_in "Shipping type", with: @offer_product.shipping_type_id
    fill_in "Shipping value", with: @offer_product.shipping_value
    fill_in "Subtotal", with: @offer_product.subtotal
    click_on "Update Offer product"

    assert_text "Offer product was successfully updated"
    click_on "Back"
  end

  test "should destroy Offer product" do
    visit offer_product_url(@offer_product)
    click_on "Destroy this offer product", match: :first

    assert_text "Offer product was successfully destroyed"
  end
end
