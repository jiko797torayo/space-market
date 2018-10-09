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

ActiveRecord::Schema.define(version: 20181009065813) do

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_likes_on_space_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "reservation_hours", force: :cascade do |t|
    t.integer  "zero",         default: 0, null: false
    t.integer  "one",          default: 0, null: false
    t.integer  "two",          default: 0, null: false
    t.integer  "three",        default: 0, null: false
    t.integer  "four",         default: 0, null: false
    t.integer  "five",         default: 0, null: false
    t.integer  "six",          default: 0, null: false
    t.integer  "seven",        default: 0, null: false
    t.integer  "eight",        default: 0, null: false
    t.integer  "nine",         default: 0, null: false
    t.integer  "ten",          default: 0, null: false
    t.integer  "eleven",       default: 0, null: false
    t.integer  "twelve",       default: 0, null: false
    t.integer  "thirteen",     default: 0, null: false
    t.integer  "fourteen",     default: 0, null: false
    t.integer  "fifteen",      default: 0, null: false
    t.integer  "sixteen",      default: 0, null: false
    t.integer  "seventeen",    default: 0, null: false
    t.integer  "eighteen",     default: 0, null: false
    t.integer  "nineteen",     default: 0, null: false
    t.integer  "twenty",       default: 0, null: false
    t.integer  "twenty_one",   default: 0, null: false
    t.integer  "twenty_two",   default: 0, null: false
    t.integer  "twenty_three", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.date     "day",                 null: false
    t.integer  "reservation_user_id"
    t.integer  "user_id"
    t.integer  "space_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["reservation_user_id"], name: "index_reservations_on_reservation_user_id"
    t.index ["space_id"], name: "index_reservations_on_space_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             null: false
    t.string   "last_name",              null: false
    t.string   "email",                  null: false
    t.string   "icon"
    t.string   "encrypted_password",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
