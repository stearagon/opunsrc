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

ActiveRecord::Schema.define(version: 20150913145309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["likeable_id"], name: "index_likes_on_likeable_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "puns", force: :cascade do |t|
    t.string   "term",                   null: false
    t.string   "pun",                    null: false
    t.string   "example",                null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    default: 1, null: false
  end

  add_index "puns", ["term"], name: "index_puns_on_term", unique: true, using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars",                  null: false
    t.integer  "pun_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    default: 1, null: false
  end

  create_table "requests", force: :cascade do |t|
    t.text     "description",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     default: 1, null: false
  end

  create_table "requests_puns", id: false, force: :cascade do |t|
    t.integer  "request_id", null: false
    t.integer  "pun_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests_puns", ["pun_id"], name: "index_requests_puns_on_pun_id", using: :btree
  add_index "requests_puns", ["request_id"], name: "index_requests_puns_on_request_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title",                  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    default: 1, null: false
  end

  create_table "topics_puns", id: false, force: :cascade do |t|
    t.integer  "topic_id",   null: false
    t.integer  "pun_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "topics_puns", ["pun_id"], name: "index_topics_puns_on_pun_id", using: :btree
  add_index "topics_puns", ["topic_id"], name: "index_topics_puns_on_topic_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "handle",          null: false
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["handle"], name: "index_users_on_handle", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
