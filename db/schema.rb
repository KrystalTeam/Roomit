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

ActiveRecord::Schema.define(version: 2023_01_03_115234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.date "start_at", null: false
    t.date "end_at", null: false
    t.integer "price_per_night", null: false
    t.integer "state", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "serial"
    t.integer "headcount", default: 1, null: false
    t.index ["room_id"], name: "index_bookings_on_room_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "reviews", id: false, force: :cascade do |t|
    t.integer "guest_rating"
    t.integer "accuracy_rating"
    t.integer "check_in_rating"
    t.integer "cleanliness_rating"
    t.integer "communication_rating"
    t.integer "location_rating"
    t.integer "value_rating"
    t.string "comment"
    t.string "review_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "id"
    t.bigint "booking_id"
    t.bigint "room_id"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["room_id"], name: "index_reviews_on_room_id"
  end

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
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.integer "checkin_start_at"
    t.integer "checkin_end_at"
    t.integer "checkout_time"
    t.date "published_at"
    t.string "city", default: "", null: false
    t.string "district", default: "", null: false
    t.decimal "lat", precision: 13, scale: 10
    t.decimal "lng", precision: 13, scale: 10
    t.index ["user_id"], name: "index_rooms_on_user_id"
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
    t.string "name"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wish_list_rooms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_wish_list_rooms_on_room_id"
    t.index ["user_id"], name: "index_wish_list_rooms_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "rooms"
  add_foreign_key "wish_list_rooms", "rooms"
  add_foreign_key "wish_list_rooms", "users"
end
