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

ActiveRecord::Schema.define(version: 2022_12_05_095315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rooms", force: :cascade do |t|
    t.string "home_type"
    t.string "room_type"
    t.integer "max_occupancy", default: 2
    t.integer "bedrooms", default: 1
    t.integer "bathrooms", default: 1
    t.text "summary"
    t.string "address"
    t.boolean "has_wifi", default: false
    t.boolean "has_kitchen", default: false
    t.boolean "has_air_con", default: false
    t.boolean "has_bathtub", default: false
    t.integer "price"
    t.datetime "published_at"
    t.time "checkin_start_at", default: "2000-01-01 15:00:00"
    t.time "checkin_end_at", default: "2000-01-01 23:59:59"
    t.time "checkout_time", default: "2000-01-01 12:00:00"
    t.datetime "deleted_at"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
