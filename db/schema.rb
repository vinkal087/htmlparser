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

ActiveRecord::Schema.define(version: 20160906070323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "url_anchors", force: :cascade do |t|
    t.integer  "url_list_id"
    t.string   "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "url_anchors", ["url_list_id"], name: "index_url_anchors_on_url_list_id", using: :btree

  create_table "url_header1s", force: :cascade do |t|
    t.integer  "url_list_id"
    t.string   "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "url_header1s", ["url_list_id"], name: "index_url_header1s_on_url_list_id", using: :btree

  create_table "url_header2s", force: :cascade do |t|
    t.integer  "url_list_id"
    t.string   "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "url_header2s", ["url_list_id"], name: "index_url_header2s_on_url_list_id", using: :btree

  create_table "url_header3s", force: :cascade do |t|
    t.integer  "url_list_id"
    t.string   "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "url_header3s", ["url_list_id"], name: "index_url_header3s_on_url_list_id", using: :btree

  create_table "url_lists", force: :cascade do |t|
    t.string   "url"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "url_anchors", "url_lists"
  add_foreign_key "url_header1s", "url_lists"
  add_foreign_key "url_header2s", "url_lists"
  add_foreign_key "url_header3s", "url_lists"
end
