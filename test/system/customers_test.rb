require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "should create customer" do
    visit customers_url
    click_on "New customer"

    fill_in "City", with: @customer.city
    fill_in "Company name", with: @customer.company_name
    fill_in "Complement", with: @customer.complement
    fill_in "Country", with: @customer.country
    fill_in "Ein number", with: @customer.ein_number
    fill_in "Last user modified", with: @customer.last_user_modified
    fill_in "Main email", with: @customer.main_email
    fill_in "Main phone number", with: @customer.main_phone_number
    fill_in "Municipal tax", with: @customer.municipal_tax_id
    fill_in "Number", with: @customer.number
    fill_in "Second email", with: @customer.second_email
    fill_in "Second phone number", with: @customer.second_phone_number
    fill_in "State", with: @customer.state
    fill_in "State tax", with: @customer.state_tax_id
    fill_in "Street", with: @customer.street
    fill_in "Third email", with: @customer.third_email
    fill_in "Trading name", with: @customer.trading_name
    fill_in "User", with: @customer.user_id
    fill_in "Whatsapp number", with: @customer.whatsapp_number
    fill_in "Zip code", with: @customer.zip_code
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "should update Customer" do
    visit customer_url(@customer)
    click_on "Edit this customer", match: :first

    fill_in "City", with: @customer.city
    fill_in "Company name", with: @customer.company_name
    fill_in "Complement", with: @customer.complement
    fill_in "Country", with: @customer.country
    fill_in "Ein number", with: @customer.ein_number
    fill_in "Last user modified", with: @customer.last_user_modified
    fill_in "Main email", with: @customer.main_email
    fill_in "Main phone number", with: @customer.main_phone_number
    fill_in "Municipal tax", with: @customer.municipal_tax_id
    fill_in "Number", with: @customer.number
    fill_in "Second email", with: @customer.second_email
    fill_in "Second phone number", with: @customer.second_phone_number
    fill_in "State", with: @customer.state
    fill_in "State tax", with: @customer.state_tax_id
    fill_in "Street", with: @customer.street
    fill_in "Third email", with: @customer.third_email
    fill_in "Trading name", with: @customer.trading_name
    fill_in "User", with: @customer.user_id
    fill_in "Whatsapp number", with: @customer.whatsapp_number
    fill_in "Zip code", with: @customer.zip_code
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "should destroy Customer" do
    visit customer_url(@customer)
    click_on "Destroy this customer", match: :first

    assert_text "Customer was successfully destroyed"
  end
end
