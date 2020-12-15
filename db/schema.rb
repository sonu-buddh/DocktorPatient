# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_15_074042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appoinments", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "user_id"
    t.integer "doctor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.datetime "booked_date"
  end

  create_table "availabilities", force: :cascade do |t|
    t.datetime "available_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
  end

  create_table "doctor_availables", force: :cascade do |t|
    t.datetime "available_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doctor_salaries", force: :cascade do |t|
    t.integer "january"
    t.integer "february"
    t.integer "march"
    t.integer "april"
    t.integer "may"
    t.integer "june"
    t.integer "july"
    t.integer "august"
    t.integer "september"
    t.integer "october"
    t.integer "november"
    t.integer "december"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.integer "january"
    t.integer "february"
    t.integer "march"
    t.integer "april"
    t.integer "may"
    t.integer "june"
    t.integer "july"
    t.integer "august"
    t.integer "september"
    t.integer "october"
    t.integer "november"
    t.integer "december"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
