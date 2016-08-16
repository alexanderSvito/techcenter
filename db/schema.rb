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

ActiveRecord::Schema.define(version: 20160505070523) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id",    limit: 4
    t.integer  "item_id",    limit: 4
    t.string   "name",       limit: 255
    t.float    "price",      limit: 24
    t.string   "group",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.boolean  "status",               default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "number",     limit: 255
    t.integer  "user_id",    limit: 4
    t.string   "bank",       limit: 255
    t.float    "balance",    limit: 24
    t.boolean  "status",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "item_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.float    "rate",       limit: 24
    t.text     "review",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "link",           limit: 255
    t.string   "imageable_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "group",               limit: 255
    t.integer  "price",               limit: 4
    t.text     "description",         limit: 65535
    t.text     "details",             limit: 65535
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  create_table "paychecks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "cart_id",    limit: 4
    t.string   "address",    limit: 255
    t.string   "number",     limit: 255
    t.float    "total",      limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.string   "password_digest",     limit: 255
    t.string   "remember_digest",     limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "refferedby",          limit: 4
    t.string   "address",             limit: 255
    t.string   "number",              limit: 255
    t.string   "activation_digest",   limit: 255
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest",        limit: 255
    t.datetime "reset_sent_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
