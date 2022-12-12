require "application_system_test_case"

class ShippingTypesTest < ApplicationSystemTestCase
  setup do
    @shipping_type = shipping_types(:one)
  end

  test "visiting the index" do
    visit shipping_types_url
    assert_selector "h1", text: "Shipping types"
  end

  test "should create shipping type" do
    visit shipping_types_url
    click_on "New shipping type"

    fill_in "Code", with: @shipping_type.code
    fill_in "Name", with: @shipping_type.name
    click_on "Create Shipping type"

    assert_text "Shipping type was successfully created"
    click_on "Back"
  end

  test "should update Shipping type" do
    visit shipping_type_url(@shipping_type)
    click_on "Edit this shipping type", match: :first

    fill_in "Code", with: @shipping_type.code
    fill_in "Name", with: @shipping_type.name
    click_on "Update Shipping type"

    assert_text "Shipping type was successfully updated"
    click_on "Back"
  end

  test "should destroy Shipping type" do
    visit shipping_type_url(@shipping_type)
    click_on "Destroy this shipping type", match: :first

    assert_text "Shipping type was successfully destroyed"
  end
end
