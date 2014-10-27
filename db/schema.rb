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

ActiveRecord::Schema.define(version: 20141027124910) do

  create_table "blocks", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "css_id"
    t.string   "css_classes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blocks", ["title"], name: "index_blocks_on_title"

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "order"
    t.string   "slug"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
