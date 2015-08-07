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

ActiveRecord::Schema.define(version: 20150807092105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "people"
    t.string   "category"
    t.string   "description"
    t.boolean  "public"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.integer  "space_id"
    t.date     "date"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "events", ["space_id"], name: "index_events_on_space_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "body"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "subject"
    t.boolean  "unread",       default: true
  end

  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "last_name"
    t.integer  "earnings",   default: 0
    t.integer  "user_id"
    t.boolean  "public"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "first_name"
    t.string   "bio"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "space_id"
    t.integer  "event_id"
    t.string   "body"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  add_index "requests", ["event_id"], name: "index_requests_on_event_id", using: :btree
  add_index "requests", ["space_id"], name: "index_requests_on_space_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "space_id"
    t.integer  "rating"
    t.string   "body"
    t.string   "reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["space_id"], name: "index_reviews_on_space_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "spaces", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "description"
    t.string   "location"
    t.integer  "price"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "capacity"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "spaces", ["user_id"], name: "index_spaces_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "events", "spaces"
  add_foreign_key "events", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "spaces"
  add_foreign_key "reviews", "users"
  add_foreign_key "spaces", "users"
end
