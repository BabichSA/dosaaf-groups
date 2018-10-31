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

ActiveRecord::Schema.define(version: 2018_10_31_082613) do

  create_table "drivings", force: :cascade do |t|
    t.integer "instructor_id", null: false
    t.integer "student_id", null: false
    t.datetime "start_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id", "student_id", "start_date"], name: "index_drivings_on_instructor_id_and_student_id_and_start_date", unique: true
    t.index ["instructor_id"], name: "index_drivings_on_instructor_id"
    t.index ["student_id"], name: "index_drivings_on_student_id"
  end

  create_table "group_apps", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.boolean "available", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_link"
    t.string "fa_icon"
    t.index ["available"], name: "index_group_apps_on_available"
    t.index ["name"], name: "index_group_apps_on_name", unique: true
  end

  create_table "homeworks", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.date "assigned_at"
    t.boolean "available", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "car"
    t.string "car_number"
    t.index ["full_name"], name: "index_instructors_on_full_name"
  end

  create_table "students", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "phone"
    t.string "address"
    t.string "work"
    t.integer "grade", default: 0
    t.integer "driving_hours", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["full_name"], name: "index_students_on_full_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
