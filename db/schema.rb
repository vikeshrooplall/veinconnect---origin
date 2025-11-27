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

ActiveRecord::Schema[7.1].define(version: 2025_11_25_114800) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blood_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "facility_id", null: false
    t.string "blood_type"
    t.string "patient_name"
    t.integer "patient_phone_number"
    t.date "needed_by"
    t.string "message"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.integer "urgency"
    t.integer "status", default: 0, null: false
    t.index ["facility_id"], name: "index_blood_requests_on_facility_id"
    t.index ["user_id"], name: "index_blood_requests_on_user_id"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "donor_id", null: false
    t.bigint "blood_request_id", null: false
    t.bigint "facility_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blood_request_id"], name: "index_donations_on_blood_request_id"
    t.index ["donor_id"], name: "index_donations_on_donor_id"
    t.index ["facility_id"], name: "index_donations_on_facility_id"
  end

  create_table "donors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "donor_status", default: true
    t.boolean "eligibility_status", default: true
    t.date "last_donation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_donors_on_user_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "phone_number"
    t.string "facility_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "notifiable_type", null: false
    t.bigint "notifiable_id", null: false
    t.string "kind"
    t.json "data"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blood_request_id", null: false
    t.index ["blood_request_id"], name: "index_notifications_on_blood_request_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.integer "phone"
    t.string "address"
    t.string "blood_type"
    t.boolean "is_donor"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blood_requests", "facilities"
  add_foreign_key "blood_requests", "users"
  add_foreign_key "donations", "blood_requests"
  add_foreign_key "donations", "donors"
  add_foreign_key "donations", "facilities"
  add_foreign_key "donors", "users"
  add_foreign_key "notifications", "blood_requests"
  add_foreign_key "notifications", "users"
end
