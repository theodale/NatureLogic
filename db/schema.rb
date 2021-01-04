# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_04_085300) do

  create_table "farms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "location"
    t.string "latitude"
    t.string "longitude"
    t.integer "farm_area"
    t.integer "pasture_area"
    t.integer "crop_area"
    t.integer "hedgerow_area"
    t.integer "woodland_area"
    t.integer "set_aside_1yr_area"
    t.integer "set_aside_1yr_to_5yr_area"
    t.integer "set_aside_5yr_area"
    t.integer "diesel_use"
    t.integer "gas_use"
    t.integer "electricity_use"
    t.integer "sheep"
    t.integer "cows"
    t.integer "tillage_area"
    t.integer "sprayage_area"
    t.integer "annual_applied_artificial_fertiliser"
    t.integer "annual_applied_pesticide"
    t.integer "annual_applied_herbicide"
    t.integer "annual_applied_fungicide"
    t.boolean "organic"
    t.integer "machinery_spend"
    t.integer "labour_spend"
    t.integer "feed_spend"
    t.integer "non_fuel_spend"
  end

end
