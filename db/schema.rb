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

ActiveRecord::Schema.define(version: 2021_03_03_094045) do

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

  create_table "biodiversity_surveys", force: :cascade do |t|
    t.integer "area_designated_for_natural_conservation", default: 0
    t.integer "area_in_existing_agri_environment_schemes", default: 0
    t.integer "area_of_grass_wildflower_scrub_not_for_production", default: 0
    t.integer "wider_countryside_description", default: 0
    t.integer "number_of_crop_types", default: 0
    t.integer "number_of_heritage_crops", default: 0
    t.integer "number_of_livestock_breeds", default: 0
    t.integer "number_of_rare_breeds", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "farm_id"
    t.boolean "threatened_species", default: false
    t.string "threatened_species_description", default: "No Description"
    t.integer "number_of_vascular_plant_species", default: 0
    t.integer "number_of_wild_bee_species", default: 0
    t.integer "number_of_farmland_bird_species", default: 0
    t.integer "number_of_butterfly_species", default: 0
    t.integer "number_of_mammal_species", default: 0
    t.boolean "crop_protection_use", default: false
    t.boolean "legumes_or_grass_cover_in_crop_rotation", default: false
    t.boolean "grow_cover_crops", default: false
    t.boolean "grow_three_cover_crops", default: false
    t.boolean "soil_covered_cereal_grass_or_cover_crops", default: false
    t.boolean "shallow_tillage", default: false
    t.boolean "no_tillage", default: false
    t.boolean "conventional_tillage", default: false
    t.boolean "no_soil_health_measures", default: true
    t.boolean "solid_manure", default: false
    t.boolean "compost", default: false
    t.boolean "residues_not_removed", default: false
    t.boolean "grass_mix_incorporated", default: false
    t.boolean "organic_fertilizers_in_response", default: false
    t.boolean "no_organic_matter", default: true
    t.boolean "slurry_mineral_fertilizer_not_used", default: false
    t.boolean "bird_nests_marked", default: false
    t.boolean "extensive_grazing_only", default: false
    t.boolean "mowing_grazing_delayed", default: false
    t.boolean "refuge_areas", default: false
    t.boolean "no_grassland_measures", default: true
    t.boolean "hedgerows_pruned_three_years", default: false
    t.boolean "hedgerow_grass_margin", default: false
    t.boolean "no_hedgerows", default: true
    t.boolean "water_courses", default: false
    t.boolean "river_bank_vegetation_mowed_two_years", default: false
    t.boolean "river_bank_vegetation_left_standing", default: false
    t.boolean "water_course_buffered_twelve_metres", default: false
    t.boolean "water_course_cleared_regularly", default: false
    t.boolean "dredge_cuttings_removed_promptly", default: false
    t.boolean "no_water_courses", default: true
    t.boolean "pools_and_ponds", default: false
    t.boolean "pond_ditches_buffered", default: false
    t.boolean "pond_bank_vegetation_mowed_two_years", default: false
    t.boolean "pond_bank_vegetation_left_standing", default: false
    t.boolean "pond_plants_cleared_three_years", default: false
    t.boolean "pond_cuttings_removed_promptly", default: false
    t.boolean "pond_dredged_five_years", default: false
    t.boolean "pond_shading_prevented", default: false
    t.boolean "no_pools_and_ponds", default: true
    t.integer "number_of_merino", default: 0
    t.integer "number_of_rambouillet", default: 0
    t.integer "number_of_blue_faced_leicester", default: 0
    t.integer "number_of_corridale", default: 0
    t.integer "number_of_columbia", default: 0
    t.integer "number_of_suffolk", default: 0
    t.integer "number_of_dohne", default: 0
    t.integer "number_of_poll_dorset", default: 0
    t.integer "number_of_composites", default: 0
    t.index ["farm_id"], name: "index_biodiversity_surveys_on_farm_id"
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
