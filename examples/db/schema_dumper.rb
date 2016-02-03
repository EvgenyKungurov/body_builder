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

ActiveRecord::Schema.define(version: 20160128135049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_restrictions", force: :cascade do |t|
    t.text     "name"
    t.text     "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "status"
    t.string   "user_id"
    t.string   "day"
    t.string   "symbol_name_turn"
    t.string   "turn_id"
    t.string   "hour"
    t.string   "minute"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string   "type"
    t.string   "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.text     "name"
    t.text     "world_of_alphabet"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "turns", force: :cascade do |t|
    t.text     "day"
    t.text     "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "password_digest"
    t.text     "remember_token"
    t.string   "group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
