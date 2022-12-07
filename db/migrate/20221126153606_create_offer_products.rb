class CreateOfferProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :offer_products do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :quantity, precision: 12, scale: 4, default: 0.0
      t.decimal :price, precision: 12, scale: 4, default: 0.0
      t.decimal :price_with_icms, precision: 12, scale: 4, default: 0.0
      t.decimal :shipping_value, precision: 12, scale: 2, default: 0.0
      t.decimal :subtotal, precision: 18, scale: 2
      t.boolean :exchangeable, default: false
      t.references :shipping_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
