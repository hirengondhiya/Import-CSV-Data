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

ActiveRecord::Schema.define(version: 2020_10_23_001307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "affiliations_people", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "affiliation_id", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations_people", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "location_id", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "species"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "name"
  end

  create_table "person_weapons", force: :cascade do |t|
    t.bigint "weapon_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_weapons_on_person_id"
    t.index ["weapon_id"], name: "index_person_weapons_on_weapon_id"
  end

  create_table "vehicle_people", force: :cascade do |t|
    t.bigint "vehicle_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_vehicle_people_on_person_id"
    t.index ["vehicle_id"], name: "index_vehicle_people_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "person_weapons", "people"
  add_foreign_key "person_weapons", "weapons"
  add_foreign_key "vehicle_people", "people"
  add_foreign_key "vehicle_people", "vehicles"
end
