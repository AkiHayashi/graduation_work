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

ActiveRecord::Schema.define(version: 2021_10_19_114120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.date "birth_date", null: false
    t.string "icon"
    t.string "mail", default: "", null: false
    t.string "address", default: "", null: false
    t.string "tel", default: "", null: false
    t.integer "allergy", default: 0, null: false
    t.boolean "admin", default: false, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mail"], name: "index_accounts_on_mail", unique: true
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_families_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "diary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_favorites_on_diary_id"
    t.index ["user_id", "diary_id"], name: "index_favorites_on_user_id_and_diary_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "health_statuses", force: :cascade do |t|
    t.integer "systolic", null: false
    t.integer "diastolic", null: false
    t.integer "pulse", null: false
    t.text "condition", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_health_statuses_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", default: "", null: false
    t.string "tel", default: "", null: false
    t.bigint "medical_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_history_id"], name: "index_hospitals_on_medical_history_id"
  end

  create_table "medical_histories", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_on"
    t.string "surgery", default: "", null: false
    t.date "surgery_on"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_medical_histories_on_user_id"
  end

  create_table "medication_histories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "usage", default: 0, null: false
    t.date "prescription_on"
    t.text "note", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_medication_histories_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_members_on_family_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", default: "", null: false
    t.string "tel", default: "", null: false
    t.bigint "medication_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_history_id"], name: "index_pharmacies_on_medication_history_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login_name", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["login_name"], name: "index_users_on_login_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "diaries", "users"
  add_foreign_key "families", "users"
  add_foreign_key "favorites", "diaries"
  add_foreign_key "favorites", "users"
  add_foreign_key "health_statuses", "users"
  add_foreign_key "hospitals", "medical_histories"
  add_foreign_key "medical_histories", "users"
  add_foreign_key "medication_histories", "users"
  add_foreign_key "members", "families"
  add_foreign_key "members", "users"
  add_foreign_key "pharmacies", "medication_histories"
end
