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

ActiveRecord::Schema.define(version: 2019_05_08_233804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gears", force: :cascade do |t|
    t.string "name"
    t.integer "armor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hero_gears", force: :cascade do |t|
    t.bigint "hero_id"
    t.bigint "gear_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gear_id"], name: "index_hero_gears_on_gear_id"
    t.index ["hero_id"], name: "index_hero_gears_on_hero_id"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "archetype"
    t.string "range"
    t.string "damage"
    t.string "race"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_heros_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hero_gears", "gears"
  add_foreign_key "hero_gears", "heros"
  add_foreign_key "heros", "users"
end
