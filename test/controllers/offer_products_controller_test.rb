require "test_helper"

class OfferProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer_product = offer_products(:one)
  end

  test "should get index" do
    get offer_products_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_product_url
    assert_response :success
  end

  test "should create offer_product" do
    assert_difference("OfferProduct.count") do
      post offer_products_url, params: { offer_product: { exchangeable: @offer_product.exchangeable, offer_id: @offer_product.offer_id, price: @offer_product.price, price_with_icms: @offer_product.price_with_icms, product_id: @offer_product.product_id, quantity: @offer_product.quantity, shipping_type_id: @offer_product.shipping_type_id, shipping_value: @offer_product.shipping_value, subtotal: @offer_product.subtotal } }
    end

    assert_redirected_to offer_product_url(OfferProduct.last)
  end

  test "should show offer_product" do
    get offer_product_url(@offer_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_product_url(@offer_product)
    assert_response :success
  end

  test "should update offer_product" do
    patch offer_product_url(@offer_product), params: { offer_product: { exchangeable: @offer_product.exchangeable, offer_id: @offer_product.offer_id, price: @offer_product.price, price_with_icms: @offer_product.price_with_icms, product_id: @offer_product.product_id, quantity: @offer_product.quantity, shipping_type_id: @offer_product.shipping_type_id, shipping_value: @offer_product.shipping_value, subtotal: @offer_product.subtotal } }
    assert_redirected_to offer_product_url(@offer_product)
  end

  test "should destroy offer_product" do
    assert_difference("OfferProduct.count", -1) do
      delete offer_product_url(@offer_product)
    end

    assert_redirected_to offer_products_url
  end
end
