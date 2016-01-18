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

ActiveRecord::Schema.define(version: 20160114131323) do

  create_table "caishuo_p2p_product_producttradingentry", force: :cascade do |t|
    t.datetime "created_at",                      precision: 6, null: false
    t.string   "status",       limit: 16,                       null: false
    t.integer  "amount",       limit: 8,                        null: false
    t.integer  "product_id",   limit: 4,                        null: false
    t.integer  "user_id",      limit: 4,                        null: false
    t.integer  "coupon_id",    limit: 4
    t.datetime "expire_time",                     precision: 6
    t.string   "bank_card_id", limit: 64
    t.text     "extra_data",   limit: 4294967295
  end

  add_index "caishuo_p2p_product_producttradingentry", ["coupon_id"], name: "caishuo_p2p_product_producttradingentry_2fb72c6e", using: :btree
  add_index "caishuo_p2p_product_producttradingentry", ["product_id"], name: "ca_product_id_244871c0fdb0861a_fk_caishuo_p2p_product_product_id", using: :btree
  add_index "caishuo_p2p_product_producttradingentry", ["user_id"], name: "caishuo_p2p_product_pro_user_id_769cabd3fe6e5caf_fk_auth_user_id", using: :btree

  create_table "coins_logs", force: :cascade do |t|
    t.integer  "caishuo_id", limit: 4
    t.integer  "coins_id",   limit: 4
    t.string   "name",       limit: 255
    t.float    "amount",     limit: 24
    t.string   "status",     limit: 255
    t.string   "product",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coins_logs_copy", id: false, force: :cascade do |t|
    t.integer  "caishuo_id", limit: 4,  null: false
    t.integer  "coins_id",   limit: 4,  null: false
    t.string   "name",       limit: 16
    t.integer  "amount",     limit: 4
    t.datetime "created_at"
    t.string   "status",     limit: 16
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.integer  "status",     limit: 4,     default: 1
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "content",    limit: 255
    t.boolean  "published",              default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "posts", ["published"], name: "index_posts_on_published", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "user_events_2", id: false, force: :cascade do |t|
    t.integer  "id",                limit: 4,                  null: false
    t.integer  "user_id",           limit: 4,                  null: false
    t.string   "channel_code",      limit: 50
    t.datetime "created_at"
    t.string   "device",            limit: 20
    t.boolean  "simulated_account",            default: false
    t.boolean  "coin_account",                 default: false
  end

  create_table "user_logs", primary_key: "user_id", force: :cascade do |t|
    t.string   "channel_code",      limit: 50
    t.datetime "created_at"
    t.string   "device",            limit: 20
    t.boolean  "simulated_account",            default: false
    t.boolean  "coin_account",                 default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
