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

ActiveRecord::Schema.define(version: 20160323015228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coupons", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "code",                      null: false
    t.text     "url"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.boolean  "enabled",    default: true, null: false
    t.text     "rules_url"
    t.string   "affiliate"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "store_id"
  end

  add_index "coupons", ["name", "affiliate"], name: "index_coupons_on_name_and_affiliate", unique: true, using: :btree
  add_index "coupons", ["store_id"], name: "index_coupons_on_store_id", using: :btree
  add_index "coupons", ["user_id"], name: "index_coupons_on_user_id", using: :btree

  create_table "promotions", force: :cascade do |t|
    t.string   "name",                        null: false
    t.text     "description"
    t.string   "external_id"
    t.text     "image_url"
    t.float    "discount"
    t.float    "price_from"
    t.float    "price_to",                    null: false
    t.float    "price_billet"
    t.text     "url",                         null: false
    t.boolean  "enabled",      default: true, null: false
    t.string   "affiliate",                   null: false
    t.datetime "begin_at"
    t.datetime "end_at"
    t.integer  "user_id"
    t.integer  "store_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "promotions", ["name", "affiliate"], name: "index_promotions_on_name_and_affiliate", unique: true, using: :btree
  add_index "promotions", ["store_id"], name: "index_promotions_on_store_id", using: :btree
  add_index "promotions", ["user_id"], name: "index_promotions_on_user_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "twitter"
    t.text     "logo_url"
    t.text     "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "color"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
