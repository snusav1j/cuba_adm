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

ActiveRecord::Schema[8.0].define(version: 2024_11_28_072207) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "autorization_logs", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_places", force: :cascade do |t|
    t.string "marketplace_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_logs", force: :cascade do |t|
    t.integer "product_id"
    t.integer "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "product_photos", force: :cascade do |t|
    t.integer "product_id"
    t.string "photo_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "description"
    t.integer "author_id"
    t.integer "available"
    t.integer "marketplace"
    t.integer "buy_price"
    t.integer "sold"
    t.integer "sell_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "desired_price"
  end

  create_table "profile_photos", force: :cascade do |t|
    t.integer "user_id"
    t.string "photo_url"
    t.string "photo_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sell_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "sell_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "super_logs", force: :cascade do |t|
    t.integer "log_id"
    t.integer "user_id"
    t.integer "action"
    t.integer "log_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_tables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "test_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "role"
    t.string "email"
    t.string "login"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
