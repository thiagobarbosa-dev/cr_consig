# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_26_122728) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "company_name"
    t.string "trading_name"
    t.string "ein_number", limit: 15
    t.string "state_tax_id", limit: 15
    t.string "municipal_tax_id", limit: 15
    t.string "street"
    t.string "number", limit: 8
    t.string "complement"
    t.string "zip_code", limit: 10
    t.string "main_email"
    t.string "second_email"
    t.string "third_email"
    t.string "whatsapp_number", limit: 15
    t.string "main_phone_number", limit: 15
    t.string "second_phone_number", limit: 15
    t.string "country"
    t.string "state"
    t.string "city"
    t.bigint "user_id", null: false
    t.bigint "last_update_by_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["last_update_by_user_id"], name: "index_customers_on_last_update_by_user_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "active_ingredient"
    t.string "reference"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "last_update_by_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["last_update_by_user_id"], name: "index_products_on_last_update_by_user_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", default: "", null: false
    t.string "login", default: "", null: false
    t.string "federal_tax_id"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "users"
  add_foreign_key "customers", "users", column: "last_update_by_user_id"
  add_foreign_key "products", "users"
  add_foreign_key "products", "users", column: "last_update_by_user_id"
end
