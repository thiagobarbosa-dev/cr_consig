require "test_helper"

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    assert_difference("Offer.count") do
      post offers_url, params: { offer: { contact: @offer.contact, customer_id: @offer.customer_id, last_update_by_user: @offer.last_update_by_user, phone_number: @offer.phone_number, subtotal: @offer.subtotal, user_id: @offer.user_id } }
    end

    assert_redirected_to offer_url(Offer.last)
  end

  test "should show offer" do
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    patch offer_url(@offer), params: { offer: { contact: @offer.contact, customer_id: @offer.customer_id, last_update_by_user: @offer.last_update_by_user, phone_number: @offer.phone_number, subtotal: @offer.subtotal, user_id: @offer.user_id } }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    assert_difference("Offer.count", -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to offers_url
  end
end
