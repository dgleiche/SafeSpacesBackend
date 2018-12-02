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

ActiveRecord::Schema.define(version: 2018_12_02_031605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessibility_information", id: :serial, force: :cascade do |t|
    t.float "score"
    t.boolean "gen_accessible"
    t.boolean "ramps"
    t.boolean "smooth"
    t.boolean "elevators"
    t.text "description"
    t.boolean "brail"
    t.integer "location_id"
    t.boolean "sound"
    t.float "sound_measure"
    t.boolean "automatic_doors"
    t.boolean "parking"
    t.boolean "bathrooms"
    t.boolean "sight_impaired"
    t.text "photos", array: true
    t.float "door_widths", array: true
    t.float "table_heights", array: true
  end

  create_table "accessibility_informations", force: :cascade do |t|
    t.float "score"
    t.boolean "gen_accessible"
    t.boolean "ramps"
    t.boolean "smooth"
    t.boolean "elevators"
    t.boolean "description"
    t.boolean "brail"
    t.boolean "sound"
    t.float "sound_measure"
    t.boolean "automatic_doors"
    t.boolean "parking"
    t.boolean "bathrooms"
    t.boolean "sight_impaired"
    t.string "photos", array: true
    t.float "door_widths", array: true
    t.float "table_heights", array: true
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_accessibility_informations_on_location_id"
  end

  create_table "disabilities", id: :serial, force: :cascade do |t|
    t.string "type", limit: 255
    t.string "name", limit: 255
  end

  create_table "location", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "address", limit: 255
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.string "zip", limit: 20
    t.float "lat"
    t.float "long"
    t.integer "location_type_id"
    t.integer "google_place_id"
  end

  create_table "location_type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "location_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.float "lat"
    t.float "long"
    t.integer "google_place_id"
    t.bigint "location_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_type_id"], name: "index_locations_on_location_type_id"
  end

  add_foreign_key "accessibility_information", "location", name: "accessibility_information_location_id_fkey"
  add_foreign_key "accessibility_informations", "locations"
  add_foreign_key "location", "location_type", name: "location_location_type_id_fkey"
  add_foreign_key "locations", "location_types"
end
