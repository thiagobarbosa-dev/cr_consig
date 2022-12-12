class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :customer, null: false, foreign_key: true
      t.decimal :total, precision: 18, scale: 2, default: 0.0
      t.references :user, null: false, foreign_key: true
      t.references :last_update_by_user, references: :users, null: true, foreign_key: { to_table: :users }
      t.string :contact
      t.string :phone_number, limit: 15

      t.timestamps
    end
  end
end
