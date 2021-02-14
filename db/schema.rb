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

ActiveRecord::Schema.define(version: 2021_02_08_162747) do

  create_table "babies", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "feeding_type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal "total_amount" precision: 6, scale: 2,
    t.integer "user_id"
    t.integer "baby_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
