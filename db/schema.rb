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

ActiveRecord::Schema.define(version: 2018_10_09_190051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "picture"
    t.text "description"
    t.boolean "news_letter_except"
    t.string "social_media"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.boolean "state"
    t.bigint "customer_id"
    t.bigint "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_requests_on_customer_id"
    t.index ["trainer_id"], name: "index_requests_on_trainer_id"
  end

  create_table "sportlers", force: :cascade do |t|
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "user_id"
    t.index ["sport_id"], name: "index_sportlers_on_sport_id"
    t.index ["user_id"], name: "index_sportlers_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "sport_type"
    t.integer "price"
    t.string "training_location"
    t.datetime "time"
    t.string "certification"
    t.boolean "availiability"
    t.string "picture"
    t.string "city"
    t.string "social_media"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.text "description"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_trainers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "customer"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "users"
  add_foreign_key "requests", "customers"
  add_foreign_key "requests", "trainers"
  add_foreign_key "sportlers", "sports"
  add_foreign_key "sportlers", "users"
  add_foreign_key "trainers", "users"
end
