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

ActiveRecord::Schema.define(version: 20160716072854) do

  create_table "chats", force: :cascade do |t|
    t.integer  "no_session_talks_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["no_session_talks_id"], name: "index_chats_on_no_session_talks_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "to_user_id"
    t.integer "no_session_users_id"
    t.integer "from_user_id"
    t.index ["from_user_id"], name: "index_friends_on_from_user_id"
    t.index ["no_session_users_id"], name: "index_friends_on_no_session_users_id"
    t.index ["to_user_id"], name: "index_friends_on_to_user_id"
  end

  create_table "no_session_talks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "message"
    t.integer  "chats_id"
    t.integer  "users_id"
    t.index ["chats_id"], name: "index_no_session_talks_on_chats_id"
    t.index ["users_id"], name: "index_no_session_talks_on_users_id"
  end

  create_table "no_session_users", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "profile_url"
  end

  create_table "talks", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "message"
    t.integer  "user_id"
    t.index ["email"], name: "index_talks_on_email", unique: true
    t.index ["reset_password_token"], name: "index_talks_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "profile_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
