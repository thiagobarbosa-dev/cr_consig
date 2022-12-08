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

ActiveRecord::Schema[7.0].define(version: 2022_12_08_121334) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_products", force: :cascade do |t|
    t.bigint "budget_id", null: false
    t.bigint "product_id", null: false
    t.decimal "quantity", precision: 12, scale: 4, default: "0.0"
    t.decimal "price", precision: 12, scale: 4, default: "0.0"
    t.decimal "price_with_icms", precision: 12, scale: 4, default: "0.0"
    t.decimal "shipping_value", precision: 12, scale: 2, default: "0.0"
    t.decimal "subtotal", precision: 18, scale: 2
    t.boolean "exchangeable", default: false
    t.bigint "shipping_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_budget_products_on_budget_id"
    t.index ["product_id"], name: "index_budget_products_on_product_id"
    t.index ["shipping_type_id"], name: "index_budget_products_on_shipping_type_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.decimal "subtotal", precision: 18, scale: 2, default: "0.0"
    t.bigint "user_id", null: false
    t.bigint "last_update_by_user_id"
    t.string "contact"
    t.string "phone_number", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_budgets_on_customer_id"
    t.index ["last_update_by_user_id"], name: "index_budgets_on_last_update_by_user_id"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

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

  create_table "offer_products", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "product_id", null: false
    t.decimal "quantity", precision: 12, scale: 4
    t.decimal "price", precision: 12, scale: 4
    t.decimal "price_with_icms", precision: 12, scale: 4
    t.decimal "shipping_value", precision: 12, scale: 2
    t.decimal "subtotal", precision: 18, scale: 2
    t.boolean "exchangeable"
    t.bigint "shipping_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_offer_products_on_offer_id"
    t.index ["product_id"], name: "index_offer_products_on_product_id"
    t.index ["shipping_type_id"], name: "index_offer_products_on_shipping_type_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.decimal "total", precision: 18, scale: 2
    t.bigint "user_id", null: false
    t.bigint "last_update_by_user_id"
    t.string "contact"
    t.string "phone_number", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_offers_on_customer_id"
    t.index ["last_update_by_user_id"], name: "index_offers_on_last_update_by_user_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
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

  create_table "shipping_types", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "budget_products", "budgets"
  add_foreign_key "budget_products", "products"
  add_foreign_key "budget_products", "shipping_types"
  add_foreign_key "budgets", "customers"
  add_foreign_key "budgets", "users"
  add_foreign_key "budgets", "users", column: "last_update_by_user_id"
  add_foreign_key "customers", "users"
  add_foreign_key "customers", "users", column: "last_update_by_user_id"
  add_foreign_key "offer_products", "offers"
  add_foreign_key "offer_products", "products"
  add_foreign_key "offer_products", "shipping_types"
  add_foreign_key "offers", "customers"
  add_foreign_key "offers", "users"
  add_foreign_key "offers", "users", column: "last_update_by_user_id"
  add_foreign_key "products", "users"
  add_foreign_key "products", "users", column: "last_update_by_user_id"
end
