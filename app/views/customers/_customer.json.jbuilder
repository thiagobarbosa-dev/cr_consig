json.extract! customer, :id, :company_name, :trading_name, :ein_number, :state_tax_id, :municipal_tax_id, :street, :number, :complement, :zip_code, :main_email, :second_email, :third_email, :whatsapp_number, :main_phone_number, :second_phone_number, :country, :state, :city, :user_id, :last_user_modified, :created_at, :updated_at
json.url customer_url(customer, format: :json)
