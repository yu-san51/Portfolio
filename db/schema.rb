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

ActiveRecord::Schema.define(version: 2020_06_27_044712) do

  create_table "contracts", force: :cascade do |t|
    t.integer "contractor_id", null: false
    t.integer "contractee_id", null: false
    t.integer "item_id", null: false
    t.integer "contractor_status", default: 0, null: false
    t.integer "contract_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contractee_status", default: 0
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_styles", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "style_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "prefer_sex", default: 0, null: false
    t.integer "price", null: false
    t.string "duration", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.integer "active_status", default: 0, null: false
    t.boolean "is_continue", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "room_id"
    t.text "content"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.float "rate", null: false
    t.text "comment"
    t.integer "contract_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.integer "sex", default: 0, null: false
    t.integer "user_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id"
    t.text "introduction"
    t.datetime "deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
