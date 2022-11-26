class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :active_ingredient
      t.string :reference
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :last_update_by_user, references: :users, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
