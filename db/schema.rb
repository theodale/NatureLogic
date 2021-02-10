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

ActiveRecord::Schema.define(version: 2021_01_26_140517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "farms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "location"
    t.string "latitude"
    t.string "longitude"
    t.float "total_diesel_use", default: 0.0
    t.float "total_gas_use", default: 0.0
    t.float "total_electricity_use", default: 0.0
    t.float "artificial_fertiliser_use", default: 0.0
    t.float "agriculture_products_spend", default: 0.0
    t.float "wood_and_wood_products_spend", default: 0.0
    t.float "pesticides_spend", default: 0.0
    t.float "machinery_and_equipment_spend", default: 0.0
    t.float "other_spend", default: 0.0
    t.integer "number_of_sheep", default: 0
    t.integer "number_of_cows", default: 0
  end

  create_table "hedgerow_types", force: :cascade do |t|
    t.string "category"
    t.decimal "sequestration_per_km", default: "0.0"
    t.integer "above_ground_carbon_per_km", default: 0
    t.integer "defra_uniqueness_score", default: 0
    t.integer "area_for_nature_rating", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hedgerows", force: :cascade do |t|
    t.float "length", default: 0.0
    t.bigint "farm_id"
    t.bigint "hedgerow_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_hedgerows_on_farm_id"
    t.index ["hedgerow_type_id"], name: "index_hedgerows_on_hedgerow_type_id"
  end

  create_table "land_types", force: :cascade do |t|
    t.string "category"
    t.float "sequestration_per_ha", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "defra_uniqueness_score", default: 0
    t.integer "area_for_nature_rating", default: 0
    t.integer "above_ground_carbon_per_ha", default: 0
  end

  create_table "lands", force: :cascade do |t|
    t.float "area", default: 0.0
    t.bigint "farm_id"
    t.bigint "land_type_id"
    t.boolean "sprayed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_lands_on_farm_id"
    t.index ["land_type_id"], name: "index_lands_on_land_type_id"
  end

  create_table "targets", force: :cascade do |t|
    t.bigint "farm_id"
    t.float "net_carbon_emission", default: 0.0
    t.float "defra_habitat_score", default: 0.0
    t.float "space_for_nature_score", default: 0.0
    t.float "countryside_stewardship_score", default: 0.0
    t.float "biodiversity_score", default: 0.0
    t.float "field_based_soil_health_score", default: 0.0
    t.float "lab_based_soil_health_score", default: 0.0
    t.float "mean_SOC", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_targets_on_farm_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
