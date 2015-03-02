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

ActiveRecord::Schema.define(version: 20150302114229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "body"
    t.string   "css_id",      limit: 255
    t.string   "css_classes", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blocks", ["title"], name: "index_blocks_on_title", using: :btree

  create_table "blogs", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "category",           limit: 255
    t.string   "slug",               limit: 255
    t.text     "body"
    t.integer  "user_id"
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "my_date"
  end

  add_index "blogs", ["my_date"], name: "index_blogs_on_my_date", using: :btree
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "company",    limit: 255
    t.string   "email",      limit: 255
    t.string   "tel",        limit: 255
    t.string   "address",    limit: 255
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elements", force: :cascade do |t|
    t.string   "tag",                limit: 255
    t.string   "klass",              limit: 255
    t.text     "body"
    t.string   "href",               limit: 255
    t.integer  "x"
    t.integer  "y"
    t.integer  "speed"
    t.integer  "start"
    t.string   "easing",             limit: 255
    t.integer  "slideshow_id"
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elements", ["slideshow_id"], name: "index_elements_on_slideshow_id", using: :btree

  create_table "kundens", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.string   "url",                     limit: 255
    t.integer  "position"
    t.string   "photo_file_name",         limit: 255
    t.string   "photo_content_type",      limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_gray_file_name",    limit: 255
    t.string   "photo_gray_content_type", limit: 255
    t.integer  "photo_gray_file_size"
    t.datetime "photo_gray_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_backups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.string   "title",             limit: 255
    t.text     "body"
    t.string   "slug",              limit: 255
    t.text     "subtitle_on_image"
    t.text     "title_on_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_backups", ["page_id"], name: "index_page_backups_on_page_id", using: :btree
  add_index "page_backups", ["user_id"], name: "index_page_backups_on_user_id", using: :btree

  create_table "page_translations", force: :cascade do |t|
    t.integer  "page_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "seo_title"
    t.string   "slug"
    t.text     "body"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale", using: :btree
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",                        limit: 255
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "order"
    t.string   "slug",                         limit: 255
    t.string   "photo_file_name",              limit: 255
    t.string   "photo_content_type",           limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "subtitle_on_image"
    t.text     "title_on_image"
    t.boolean  "visible_on_sidebar",                       default: true
    t.boolean  "visible_on_navbar",                        default: true
    t.string   "pictogram_file_name",          limit: 255
    t.string   "pictogram_content_type",       limit: 255
    t.integer  "pictogram_file_size"
    t.datetime "pictogram_updated_at"
    t.string   "pictogram_hover_file_name",    limit: 255
    t.string   "pictogram_hover_content_type", limit: 255
    t.integer  "pictogram_hover_file_size"
    t.datetime "pictogram_hover_updated_at"
    t.string   "seo_title",                    limit: 255
  end

  create_table "site_settings", force: :cascade do |t|
    t.string   "site_name",            limit: 255
    t.string   "logo_file_name",       limit: 255
    t.string   "logo_content_type",    limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "favicon_file_name",    limit: 255
    t.string   "favicon_content_type", limit: 255
    t.integer  "favicon_file_size"
    t.datetime "favicon_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contact_form_text"
  end

  create_table "slideshows", force: :cascade do |t|
    t.string   "transition",              limit: 255
    t.integer  "slotamount"
    t.integer  "masterspeed"
    t.integer  "delay"
    t.string   "background_file_name",    limit: 255
    t.string   "background_content_type", limit: 255
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                    limit: 255
    t.integer  "order"
  end

  add_index "slideshows", ["order"], name: "index_slideshows_on_order", using: :btree

  create_table "sub_page_translations", force: :cascade do |t|
    t.integer  "sub_page_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "seo_title"
    t.string   "slug"
    t.text     "body"
  end

  add_index "sub_page_translations", ["locale"], name: "index_sub_page_translations_on_locale", using: :btree
  add_index "sub_page_translations", ["sub_page_id"], name: "index_sub_page_translations_on_sub_page_id", using: :btree

  create_table "sub_pages", force: :cascade do |t|
    t.string   "title"
    t.string   "seo_title"
    t.text     "body"
    t.integer  "page_id"
    t.integer  "order"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_pages", ["page_id"], name: "index_sub_pages_on_page_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
