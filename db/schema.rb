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

ActiveRecord::Schema.define(version: 2019_02_22_184816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.date "date"
    t.text "description"
    t.bigint "athlete_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_achievements_on_athlete_id"
  end

  create_table "athletes", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "profile_photo"
    t.string "cover_photo"
    t.text "achievements"
    t.index ["user_id"], name: "index_athletes_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "slogan"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "profile_photo"
    t.string "cover_photo"
    t.index ["user_id"], name: "index_brands_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.bigint "athlete_id"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "athlete_interest", default: false
    t.boolean "brand_interest", default: false
    t.index ["athlete_id"], name: "index_interests_on_athlete_id"
    t.index ["brand_id"], name: "index_interests_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "address", default: "", null: false
    t.boolean "is_athlete"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "achievements", "athletes"
  add_foreign_key "athletes", "users"
  add_foreign_key "brands", "users"
  add_foreign_key "interests", "athletes"
  add_foreign_key "interests", "brands"
end
