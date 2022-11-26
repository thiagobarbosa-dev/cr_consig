json.extract! product, :id, :name, :active_ingredient, :reference, :description, :user_id, :last_update_by_user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
