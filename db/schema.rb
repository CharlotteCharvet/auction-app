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

ActiveRecord::Schema.define(version: 20170322040242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auction_admins", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "auction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_auction_admins_on_auction_id", using: :btree
    t.index ["user_id"], name: "index_auction_admins_on_user_id", using: :btree
  end

  create_table "auctions", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "time_zone_id"
    t.text     "physical_address"
    t.string   "name"
    t.datetime "donation_window_ends_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "amount_dollars"
    t.datetime "place_at"
    t.integer  "user_id"
    t.integer  "item_id",        null: false
    t.integer  "auction_id",     null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.integer  "estimation"
    t.integer  "auction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json     "photos"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile_phone_number"
    t.string   "email_address"
    t.string   "physical_address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
    t.string   "provider"
    t.string   "uid"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true, using: :btree
    t.index ["mobile_phone_number"], name: "index_users_on_mobile_phone_number", unique: true, using: :btree
  end

  add_foreign_key "auction_admins", "auctions"
  add_foreign_key "auction_admins", "users"
  add_foreign_key "authentications", "users"
  add_foreign_key "bids", "users"
end
