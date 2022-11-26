class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :company_name
      t.string :trading_name
      t.string :ein_number, limit: 15
      t.string :state_tax_id, limit: 15
      t.string :municipal_tax_id, limit: 15
      t.string :street
      t.string :number, limit: 8
      t.string :complement
      t.string :zip_code, limit: 10
      t.string :main_email
      t.string :second_email
      t.string :third_email
      t.string :whatsapp_number, limit: 15
      t.string :main_phone_number, limit: 15
      t.string :second_phone_number, limit: 15
      t.string :country
      t.string :state
      t.string :city
      t.references :user, null: false, foreign_key: true
      t.references :last_update_by_user, references: :users, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
