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

ActiveRecord::Schema.define(version: 2022_12_07_081914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rooms", force: :cascade do |t|
    t.integer "home_type", null: false
    t.integer "room_type", null: false
    t.integer "max_occupancy", default: 2, null: false
    t.integer "bedrooms", default: 1, null: false
    t.integer "bathrooms", default: 1, null: false
    t.text "summary", null: false
    t.string "address", null: false
    t.boolean "has_wifi", default: false, null: false
    t.boolean "has_kitchen", default: false, null: false
    t.boolean "has_air_con", default: false, null: false
    t.boolean "has_bathtub", default: false, null: false
    t.integer "price", null: false
    t.datetime "published_at"
    t.time "checkin_start_at", default: "2000-01-01 15:00:00", null: false
    t.time "checkin_end_at", default: "2000-01-01 23:59:59", null: false
    t.time "checkout_time", default: "2000-01-01 12:00:00", null: false
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
    t.string "provider"
    t.string "uid"
    t.string "phone_num"
    t.text "description"
    t.integer "role", default: 0
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
