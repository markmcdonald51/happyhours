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

ActiveRecord::Schema.define(version: 20140624214308) do

  create_table "assets", force: true do |t|
    t.string   "data_file_name",                           null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id",                             null: false
    t.string   "assetable_type",    limit: 30,             null: false
    t.string   "type",              limit: 30
    t.string   "guid",              limit: 20
    t.string   "public_token",      limit: 20
    t.integer  "user_id"
    t.integer  "sort_order",                   default: 0
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["assetable_type", "type", "assetable_id"], name: "index_assets_on_assetable_type_and_type_and_assetable_id", using: :btree
  add_index "assets", ["guid"], name: "index_assets_on_guid", using: :btree
  add_index "assets", ["public_token"], name: "index_assets_on_public_token", using: :btree
  add_index "assets", ["user_id"], name: "index_assets_on_user_id", using: :btree

  create_table "escrows", force: true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.decimal  "btc_amount",                     precision: 10, scale: 0
    t.string   "buyer_email"
    t.string   "seller_email"
    t.decimal  "btc_escrow_fee",                 precision: 10, scale: 0
    t.decimal  "btc_seller_fee",                 precision: 10, scale: 0
    t.decimal  "btc_buyer_fee",                  precision: 10, scale: 0
    t.string   "tracking_number"
    t.decimal  "btc_amount_seller_will_receive", precision: 10, scale: 0
    t.integer  "max_shipping_days"
    t.integer  "inspection_days"
    t.string   "payee_invitation"
    t.string   "payer_invitation"
    t.string   "btc_address"
    t.string   "payment_invitation"
    t.string   "payment_confirmation"
    t.string   "private_WIF_key"
    t.string   "aasm_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "escrows", ["user_id"], name: "index_escrows_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "addmission_charge", precision: 10, scale: 0
    t.datetime "started_at"
    t.datetime "expired_at"
    t.text     "schedule"
    t.integer  "venue_id"
    t.string   "aasm_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "full_street_address"
    t.decimal  "lat",                 precision: 10, scale: 6
    t.decimal  "lng",                 precision: 10, scale: 6
    t.string   "aasm_state"
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["locatable_id", "locatable_type"], name: "index_locations_on_locatable_id_and_locatable_type", using: :btree

  create_table "occurences", force: true do |t|
    t.datetime "started_at"
    t.datetime "expired_at"
    t.boolean  "generated"
    t.datetime "canceled_at"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "occurences", ["event_id"], name: "index_occurrences_on_event_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "image_url"
    t.string   "oauth_token"
    t.string   "aasm_state"
    t.string   "country_code"
    t.string   "postal_code"
    t.decimal  "lat",          precision: 15, scale: 10
    t.decimal  "lng",          precision: 15, scale: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.string   "contact_name"
    t.text     "description"
    t.text     "price"
    t.string   "sm_image_link"
    t.string   "big_image_link"
    t.string   "r_link"
    t.string   "hours"
    t.text     "happy_hours"
    t.string   "aasm_state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_street_address"
    t.decimal  "lat",                 precision: 10, scale: 6
    t.decimal  "lng",                 precision: 10, scale: 6
  end

  add_index "venues", ["lat", "lng"], name: "lat_lng", using: :btree
  add_index "venues", ["name"], name: "name", using: :btree

end
