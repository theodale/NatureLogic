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

ActiveRecord::Schema.define(version: 2021_01_05_144216) do

  create_table "farms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "location"
    t.string "latitude"
    t.string "longitude"
    t.float "total_diesel_use"
    t.float "total_gas_use"
    t.float "total_electricity_use"
    t.float "artificial_fertiliser_use"
    t.float "agriculture_products_spend"
    t.float "wood_and_wood_products_spend"
    t.float "pesticides_spend"
    t.float "machinery_and_equipment_spend"
    t.float "other_spend"
    t.integer "number_of_sheep"
    t.integer "number_of_cows"
  end

  create_table "land_types", force: :cascade do |t|
    t.string "category"
    t.boolean "sprayed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lands", force: :cascade do |t|
    t.decimal "area"
    t.integer "farm_id"
    t.integer "land_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_lands_on_farm_id"
    t.index ["land_type_id"], name: "index_lands_on_land_type_id"
  end

  create_table "targets", force: :cascade do |t|
    t.integer "farm_id"
    t.decimal "net_carbon_emission"
    t.decimal "defra_habitat_score"
    t.decimal "space_for_nature_score"
    t.decimal "countryside_stewardship_score"
    t.decimal "biodiversity_score"
    t.decimal "field_based_soil_health_score"
    t.decimal "lab_based_soil_health_score"
    t.decimal "mean_SOC"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_targets_on_farm_id"
  end

end
