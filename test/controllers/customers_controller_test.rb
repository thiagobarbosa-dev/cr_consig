require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference("Customer.count") do
      post customers_url, params: { customer: { city: @customer.city, company_name: @customer.company_name, complement: @customer.complement, country: @customer.country, ein_number: @customer.ein_number, last_user_modified: @customer.last_user_modified, main_email: @customer.main_email, main_phone_number: @customer.main_phone_number, municipal_tax_id: @customer.municipal_tax_id, number: @customer.number, second_email: @customer.second_email, second_phone_number: @customer.second_phone_number, state: @customer.state, state_tax_id: @customer.state_tax_id, street: @customer.street, third_email: @customer.third_email, trading_name: @customer.trading_name, user_id: @customer.user_id, whatsapp_number: @customer.whatsapp_number, zip_code: @customer.zip_code } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { city: @customer.city, company_name: @customer.company_name, complement: @customer.complement, country: @customer.country, ein_number: @customer.ein_number, last_user_modified: @customer.last_user_modified, main_email: @customer.main_email, main_phone_number: @customer.main_phone_number, municipal_tax_id: @customer.municipal_tax_id, number: @customer.number, second_email: @customer.second_email, second_phone_number: @customer.second_phone_number, state: @customer.state, state_tax_id: @customer.state_tax_id, street: @customer.street, third_email: @customer.third_email, trading_name: @customer.trading_name, user_id: @customer.user_id, whatsapp_number: @customer.whatsapp_number, zip_code: @customer.zip_code } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference("Customer.count", -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
