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

ActiveRecord::Schema.define(version: 20150825204808) do

  create_table "puns", force: :cascade do |t|
    t.string   "term",       null: false
    t.string   "pun",        null: false
    t.string   "example",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "puns", ["term"], name: "index_puns_on_term", unique: true

  create_table "topic_puns", force: :cascade do |t|
    t.integer  "topic_id",   null: false
    t.integer  "pun_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "topic_puns", ["pun_id"], name: "index_topic_puns_on_pun_id", unique: true
  add_index "topic_puns", ["topic_id"], name: "index_topic_puns_on_topic_id", unique: true

  create_table "topics", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
