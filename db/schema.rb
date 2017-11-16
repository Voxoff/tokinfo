# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171116131435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "url"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "photo"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "followings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "token_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token_id"], name: "index_followings_on_token_id"
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "prices_tables", force: :cascade do |t|
    t.float "price_gbp"
    t.bigint "tokens_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tokens_id"], name: "index_prices_tables_on_tokens_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "name"
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "photo"
    t.text "description"
    t.float "latest_price_gbp"
    t.float "market_cap_gbp"
    t.float "one_day_volume_gbp"
    t.float "percentage_change_1h"
    t.float "percentage_change_24h"
    t.float "percentage_change_1w"
    t.float "total_supply"
    t.float "max_supply"
    t.index ["business_id"], name: "index_tokens_on_business_id"
    t.index ["user_id"], name: "index_tokens_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "businesses", "users"
  add_foreign_key "followings", "tokens"
  add_foreign_key "followings", "users"
  add_foreign_key "prices_tables", "tokens", column: "tokens_id"
  add_foreign_key "tokens", "businesses"
  add_foreign_key "tokens", "users"
end
