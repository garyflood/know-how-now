# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_11_104659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "device_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["device_id"], name: "index_bookmarks_on_device_id"
    t.index ["user_id", "device_id"], name: "index_bookmarks_on_user_id_and_device_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name", null: false
    t.datetime "created_at", null: false
    t.string "image"
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.string "images", default: [], array: true
    t.string "name", null: false
    t.string "related_devices", default: [], array: true
    t.text "text_instructions", null: false
    t.datetime "updated_at", null: false
    t.integer "views", default: 0, null: false
    t.index ["category_id"], name: "index_devices_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.string "picture"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "device_id", null: false
    t.text "script", null: false
    t.string "summary", null: false
    t.string "tags", default: [], null: false, array: true
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "views", default: 0, null: false
    t.index ["device_id"], name: "index_videos_on_device_id"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "bookmarks", "devices"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "devices", "categories"
  add_foreign_key "videos", "devices"
  add_foreign_key "videos", "users"
end
