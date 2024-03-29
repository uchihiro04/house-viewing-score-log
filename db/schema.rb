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

ActiveRecord::Schema[7.0].define(version: 2023_06_26_021743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "house_viewings", force: :cascade do |t|
    t.uuid "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_house_viewings_on_uuid", unique: true
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "house_viewing_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_viewing_id"], name: "index_rooms_on_house_viewing_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.string "reviewer_name", null: false
    t.integer "living_room", null: false
    t.integer "storage", null: false
    t.integer "kitchen", null: false
    t.integer "bath", null: false
    t.integer "toilet", null: false
    t.integer "equipment", null: false
    t.integer "surroundings", null: false
    t.integer "rent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_scores_on_room_id"
  end

  add_foreign_key "rooms", "house_viewings"
  add_foreign_key "scores", "rooms"
end
