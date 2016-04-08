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

ActiveRecord::Schema.define(version: 20160407235940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "categories", ["name", "parent_id"], name: "index_categories_on_name_and_parent_id", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.string   "code",                                   null: false
    t.text     "url"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.boolean  "enabled",                 default: true, null: false
    t.text     "rules_url"
    t.string   "affiliate"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "store_id"
    t.integer  "impressions_count",       default: 0
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "slug"
  end

  add_index "coupons", ["cached_votes_down"], name: "index_coupons_on_cached_votes_down", using: :btree
  add_index "coupons", ["cached_votes_score"], name: "index_coupons_on_cached_votes_score", using: :btree
  add_index "coupons", ["cached_votes_total"], name: "index_coupons_on_cached_votes_total", using: :btree
  add_index "coupons", ["cached_votes_up"], name: "index_coupons_on_cached_votes_up", using: :btree
  add_index "coupons", ["cached_weighted_average"], name: "index_coupons_on_cached_weighted_average", using: :btree
  add_index "coupons", ["cached_weighted_score"], name: "index_coupons_on_cached_weighted_score", using: :btree
  add_index "coupons", ["cached_weighted_total"], name: "index_coupons_on_cached_weighted_total", using: :btree
  add_index "coupons", ["name", "affiliate"], name: "index_coupons_on_name_and_affiliate", unique: true, using: :btree
  add_index "coupons", ["store_id"], name: "index_coupons_on_store_id", using: :btree
  add_index "coupons", ["user_id"], name: "index_coupons_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "promotions", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.text     "description"
    t.string   "external_id"
    t.text     "image_url"
    t.float    "discount"
    t.float    "price_from"
    t.float    "price_to",                               null: false
    t.float    "price_billet"
    t.text     "url",                                    null: false
    t.boolean  "enabled",                 default: true, null: false
    t.string   "affiliate",                              null: false
    t.datetime "begin_at"
    t.datetime "end_at"
    t.integer  "user_id"
    t.integer  "store_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "impressions_count",       default: 0
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "slug"
  end

  add_index "promotions", ["cached_votes_down"], name: "index_promotions_on_cached_votes_down", using: :btree
  add_index "promotions", ["cached_votes_score"], name: "index_promotions_on_cached_votes_score", using: :btree
  add_index "promotions", ["cached_votes_total"], name: "index_promotions_on_cached_votes_total", using: :btree
  add_index "promotions", ["cached_votes_up"], name: "index_promotions_on_cached_votes_up", using: :btree
  add_index "promotions", ["cached_weighted_average"], name: "index_promotions_on_cached_weighted_average", using: :btree
  add_index "promotions", ["cached_weighted_score"], name: "index_promotions_on_cached_weighted_score", using: :btree
  add_index "promotions", ["cached_weighted_total"], name: "index_promotions_on_cached_weighted_total", using: :btree
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
    t.string   "slug"
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
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.string   "provider_facebook"
    t.string   "uid_facebook"
    t.text     "image_url"
    t.string   "slug"
    t.string   "username"
    t.integer  "promotions_count",       default: 0
    t.integer  "coupons_count",          default: 0
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
