require "application_system_test_case"

class OffersTest < ApplicationSystemTestCase
  setup do
    @offer = offers(:one)
  end

  test "visiting the index" do
    visit offers_url
    assert_selector "h1", text: "Offers"
  end

  test "should create offer" do
    visit offers_url
    click_on "New offer"

    fill_in "Contact", with: @offer.contact
    fill_in "Customer", with: @offer.customer_id
    fill_in "Last update by user", with: @offer.last_update_by_user
    fill_in "Phone number", with: @offer.phone_number
    fill_in "Subtotal", with: @offer.subtotal
    fill_in "User", with: @offer.user_id
    click_on "Create Offer"

    assert_text "Offer was successfully created"
    click_on "Back"
  end

  test "should update Offer" do
    visit offer_url(@offer)
    click_on "Edit this offer", match: :first

    fill_in "Contact", with: @offer.contact
    fill_in "Customer", with: @offer.customer_id
    fill_in "Last update by user", with: @offer.last_update_by_user
    fill_in "Phone number", with: @offer.phone_number
    fill_in "Subtotal", with: @offer.subtotal
    fill_in "User", with: @offer.user_id
    click_on "Update Offer"

    assert_text "Offer was successfully updated"
    click_on "Back"
  end

  test "should destroy Offer" do
    visit offer_url(@offer)
    click_on "Destroy this offer", match: :first

    assert_text "Offer was successfully destroyed"
  end
end
