class CreateShippingTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_types do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
