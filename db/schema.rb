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

ActiveRecord::Schema.define(version: 20141230143727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "subject_id",   null: false
    t.string   "subject_type", null: false
    t.string   "name",         null: false
    t.string   "direction",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "match_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["match_request_id"], name: "index_comments_on_match_request_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "match_requests", force: true do |t|
    t.integer  "requester_id",                    null: false
    t.integer  "opponent_id",                     null: false
    t.text     "request_message",                 null: false
    t.boolean  "confirmed",       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "match_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "challenger_id",  null: false
    t.integer  "defender_id",    null: false
    t.datetime "match_at",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winner_id"
    t.integer  "challenger_elo"
    t.integer  "defender_elo"
    t.integer  "elo_delta"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                             null: false
    t.string   "password_digest",                                   null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "username",                                          null: false
    t.decimal  "rank"
    t.integer  "elo",             default: 1400,                    null: false
    t.string   "bio"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_url",       default: "http://bit.ly/11UlaV5"
    t.string   "location"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
