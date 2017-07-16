# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170709174227) do

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carts", ["product_id"], name: "index_carts_on_product_id"
  add_index "carts", ["user_id"], name: "index_carts_on_user_id"

  create_table "products", force: :cascade do |t|
    t.integer  "store_id"
    t.string   "name"
    t.integer  "price"
    t.string   "category"
    t.string   "photo"
    t.string   "description"
    t.string   "color"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products", ["store_id"], name: "index_products_on_store_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "photo"
    t.string   "city"
    t.string   "address"
    t.string   "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "gstin"
    t.string   "aadhar_no"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "stores", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "location"
    t.string   "contact"
    t.string   "photo"
    t.string   "description"
    t.string   "category"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stores", ["user_id"], name: "index_stores_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
