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

ActiveRecord::Schema.define(version: 20150110142347) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "contacts", force: true do |t|
    t.string   "fullname"
    t.text     "query"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "nickname"
    t.boolean  "toc",        default: false
  end

  create_table "events", force: true do |t|
    t.string   "eventname"
    t.string   "startdate"
    t.string   "enddate"
    t.text     "shortdescription"
    t.string   "region"
    t.string   "postcode"
    t.string   "website"
    t.boolean  "approved",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "long"
    t.string   "lat"
    t.string   "slug"
  end

  create_table "franchises", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fullname"
    t.string   "jobtitle"
  end

  add_index "franchises", ["email"], name: "index_franchises_on_email", unique: true
  add_index "franchises", ["reset_password_token"], name: "index_franchises_on_reset_password_token", unique: true

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "impressions", force: true do |t|
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

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "leads", force: true do |t|
    t.string   "fullname"
    t.string   "email"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "method"
    t.string   "phone"
  end

  create_table "listings", force: true do |t|
    t.string   "fullname"
    t.string   "jobtitle"
    t.string   "email"
    t.string   "franchisename"
    t.string   "leadrecepient"
    t.text     "longdescription"
    t.string   "website"
    t.string   "scale"
    t.string   "mininvestment"
    t.string   "investmentrange"
    t.string   "category"
    t.string   "hexbg"
    t.string   "logourl"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "googleplus"
    t.string   "linkedin"
    t.boolean  "spotlight",       default: false
    t.boolean  "topfranchise",    default: false
    t.boolean  "approved",        default: false
    t.boolean  "toc",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "nickname"
    t.integer  "franchise_id"
  end

  add_index "listings", ["slug"], name: "index_listings_on_slug"

  create_table "posts", force: true do |t|
    t.string   "image"
    t.string   "title"
    t.text     "content"
    t.string   "name"
    t.string   "website"
    t.boolean  "approved",   default: false
    t.boolean  "toc",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "nickname"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug"

  create_table "stories", force: true do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "jobrole"
    t.text     "story"
    t.boolean  "approved",   default: false
    t.boolean  "toc",        default: false
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fullname"
    t.string   "phone"
    t.string   "method"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
