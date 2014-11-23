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

ActiveRecord::Schema.define(version: 20141123122939) do

  create_table "blocks", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "css_id"
    t.string   "css_classes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blocks", ["title"], name: "index_blocks_on_title"

  create_table "blogs", force: true do |t|
    t.string   "title"
    t.string   "category"
    t.string   "slug"
    t.text     "body"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id"

  create_table "elements", force: true do |t|
    t.string   "tag"
    t.string   "klass"
    t.text     "body"
    t.string   "href"
    t.integer  "x"
    t.integer  "y"
    t.integer  "speed"
    t.integer  "start"
    t.string   "easing"
    t.integer  "slideshow_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width"
  end

  add_index "elements", ["slideshow_id"], name: "index_elements_on_slideshow_id"

  create_table "kundens", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_gray_file_name"
    t.string   "photo_gray_content_type"
    t.integer  "photo_gray_file_size"
    t.datetime "photo_gray_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "page_backups", force: true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.text     "subtitle_on_image"
    t.text     "title_on_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_backups", ["page_id"], name: "index_page_backups_on_page_id"
  add_index "page_backups", ["user_id"], name: "index_page_backups_on_user_id"

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
    t.text     "subtitle_on_image"
    t.text     "title_on_image"
    t.boolean  "visible_on_sidebar", default: true
    t.boolean  "visible_on_navbar",  default: true
  end

  create_table "site_settings", force: true do |t|
    t.string   "site_name"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "favicon_file_name"
    t.string   "favicon_content_type"
    t.integer  "favicon_file_size"
    t.datetime "favicon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contact_form_text"
  end

  create_table "slideshows", force: true do |t|
    t.string   "transition"
    t.integer  "slotamount"
    t.integer  "masterspeed"
    t.integer  "delay"
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "order"
  end

  add_index "slideshows", ["order"], name: "index_slideshows_on_order"

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
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
