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

ActiveRecord::Schema.define(version: 20181018040116) do

  create_table "basic_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "capacity",                null: false
    t.integer  "floor_space",             null: false
    t.integer  "starting_of_reservation", null: false
    t.integer  "passig_key_method",       null: false
    t.integer  "deadline_of_reservation", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "space_id"
    t.index ["space_id"], name: "index_basic_infos_on_space_id", using: :btree
  end

  create_table "descriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "catch_copy",                     null: false
    t.text     "overview",         limit: 65535, null: false
    t.text     "about_facilities", limit: 65535, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "space_id"
    t.index ["space_id"], name: "index_descriptions_on_space_id", using: :btree
  end

  create_table "equipment_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "postal_code",                  null: false
    t.integer  "prefecture",                   null: false
    t.string   "city_name",                    null: false
    t.text     "street_name",    limit: 65535, null: false
    t.text     "building_name",  limit: 65535, null: false
    t.float    "latitude",       limit: 24,    null: false
    t.float    "longitude",      limit: 24,    null: false
    t.text     "access",         limit: 65535, null: false
    t.string   "phone_number",                 null: false
    t.integer  "equipment_type",               null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "space_id"
    t.index ["space_id"], name: "index_equipment_infos_on_space_id", using: :btree
  end

  create_table "hosts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",             null: false
    t.string   "last_name",              null: false
    t.string   "email",                  null: false
    t.integer  "phone_number",           null: false
    t.string   "encrypted_password",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "image_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "file",           limit: 65535
    t.text     "about_file",     limit: 65535
    t.integer  "status"
    t.integer  "space_image_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["space_image_id"], name: "index_image_files_on_space_image_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_likes_on_space_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                      null: false
    t.text     "about_plan",                  limit: 65535, null: false
    t.integer  "price_per_hour",                            null: false
    t.integer  "price_per_day",                             null: false
    t.integer  "reservation_approval_method",               null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "space_id"
    t.index ["space_id"], name: "index_plans_on_space_id", using: :btree
  end

  create_table "purposes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "party",         null: false
    t.integer "meeting",       null: false
    t.integer "photo_shoot",   null: false
    t.integer "film_shoot",    null: false
    t.integer "event",         null: false
    t.integer "performance",   null: false
    t.integer "studio",        null: false
    t.integer "sports",        null: false
    t.integer "office",        null: false
    t.integer "wedding",       null: false
    t.integer "other",         null: false
    t.integer "basic_info_id", null: false
    t.index ["basic_info_id"], name: "index_purposes_on_basic_info_id", using: :btree
  end

  create_table "rental_days", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sunday",     null: false
    t.integer  "monday",     null: false
    t.integer  "tuesday",    null: false
    t.integer  "wednesday",  null: false
    t.integer  "thursday",   null: false
    t.integer  "friday",     null: false
    t.integer  "saturday",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "plan_id"
    t.index ["plan_id"], name: "index_rental_days_on_plan_id", using: :btree
  end

  create_table "rental_hours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.integer  "plan_id"
    t.integer  "start_hour",               null: false
    t.integer  "end_hour",                 null: false
    t.index ["plan_id"], name: "index_rental_hours_on_plan_id", using: :btree
  end

  create_table "reservation_hours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "zero",           default: 0, null: false
    t.integer  "one",            default: 0, null: false
    t.integer  "two",            default: 0, null: false
    t.integer  "three",          default: 0, null: false
    t.integer  "four",           default: 0, null: false
    t.integer  "five",           default: 0, null: false
    t.integer  "six",            default: 0, null: false
    t.integer  "seven",          default: 0, null: false
    t.integer  "eight",          default: 0, null: false
    t.integer  "nine",           default: 0, null: false
    t.integer  "ten",            default: 0, null: false
    t.integer  "eleven",         default: 0, null: false
    t.integer  "twelve",         default: 0, null: false
    t.integer  "thirteen",       default: 0, null: false
    t.integer  "fourteen",       default: 0, null: false
    t.integer  "fifteen",        default: 0, null: false
    t.integer  "sixteen",        default: 0, null: false
    t.integer  "seventeen",      default: 0, null: false
    t.integer  "eighteen",       default: 0, null: false
    t.integer  "nineteen",       default: 0, null: false
    t.integer  "twenty",         default: 0, null: false
    t.integer  "twenty_one",     default: 0, null: false
    t.integer  "twenty_two",     default: 0, null: false
    t.integer  "twenty_three",   default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "reservation_id"
    t.index ["reservation_id"], name: "index_reservation_hours_on_reservation_id", using: :btree
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "day",        null: false
    t.integer  "user_id"
    t.integer  "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_reservations_on_space_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "space_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_space_images_on_space_id", using: :btree
  end

  create_table "spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "likes_count", default: 0
    t.integer  "host_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["host_id"], name: "index_spaces_on_host_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "email",                                  null: false
    t.string   "icon"
    t.string   "encrypted_password",                     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "accepted",               default: false, null: false
  end

end
