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

ActiveRecord::Schema.define(version: 2021_06_20_095721) do

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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "farm_id"
    t.float "area_designated_for_natural_conservation", default: 0.0
    t.float "area_in_existing_agri_environment_schemes", default: 0.0
    t.float "area_of_grass_wildflower_scrub_not_for_production", default: 0.0
    t.string "wider_countryside_description", default: ""
    t.integer "number_of_crop_types", default: 0
    t.integer "number_of_heritage_crops", default: 0
    t.integer "number_of_livestock_breeds", default: 0
    t.integer "number_of_rare_breeds", default: 0
    t.boolean "threatened_species", default: false
    t.string "threatened_species_description", default: ""
    t.integer "number_of_vascular_plant_species", default: 0
    t.integer "number_of_wild_bee_species", default: 0
    t.integer "number_of_farmland_bird_species", default: 0
    t.integer "number_of_butterfly_species", default: 0
    t.integer "number_of_mammal_species", default: 0
    t.string "grassland_condition", default: ""
    t.index ["farm_id"], name: "index_biodiversity_surveys_on_farm_id"
  end

  create_table "countryside_stewardship_surveys", force: :cascade do |t|
    t.bigint "farm_id"
    t.boolean "nectar_flower_mix", default: false
    t.boolean "flower_rich_margins_and_plots", default: false
    t.boolean "skylark_plots", default: false
    t.boolean "nesting_plots_for_lapwing_and_stone_curlew", default: false
    t.boolean "enhanced_overwinter_stubble", default: false
    t.boolean "supplementary_winter_feeding_for_farmland_birds", default: false
    t.boolean "autumn_sown_bumblebird_mix", default: false
    t.boolean "brassica_fodder_crop", default: false
    t.boolean "winter_cover_crops", default: false
    t.boolean "arable_reversion_to_grassland_with_low_fertilizer_input", default: false
    t.boolean "small_buffer_strip_on_cultivated_land", default: false
    t.boolean "large_buffer_strip_on_cultivated_land", default: false
    t.boolean "in_field_grass_strips", default: false
    t.boolean "field_corners_out_of_production", default: false
    t.boolean "lenient_grazing_supplement", default: false
    t.boolean "buffer_strip_on_intensive_grassland", default: false
    t.boolean "management_of_intensive_grassland_adjacent_to_watercourse", default: false
    t.boolean "seasonal_livestock_removal_on_intensive_grassland", default: false
    t.boolean "management_of_hedgerows", default: false
    t.boolean "hedgerow_gapping_up", default: false
    t.boolean "planting_new_hedges", default: false
    t.boolean "pond_management", default: false
    t.boolean "buffering_in_field_ponds_and_ditches_on_arable_land", default: false
    t.boolean "tree_planting", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_countryside_stewardship_surveys_on_farm_id"
  end

  create_table "estate_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_estate_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_estate_users_on_reset_password_token", unique: true
  end

  create_table "estates", force: :cascade do |t|
    t.bigint "estate_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "location"
    t.float "carbon_price"
    t.index ["estate_user_id"], name: "index_estates_on_estate_user_id"
  end

  create_table "farm_timelines", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "farm_user_id"
    t.bigint "estate_id"
    t.string "name"
    t.string "location"
    t.string "farm_type"
    t.string "postcode"
    t.string "region"
    t.index ["estate_id"], name: "index_farm_timelines_on_estate_id"
    t.index ["farm_user_id"], name: "index_farm_timelines_on_farm_user_id"
  end

  create_table "farm_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "estate_user_id"
    t.index ["email"], name: "index_farm_users_on_email", unique: true
    t.index ["estate_user_id"], name: "index_farm_users_on_estate_user_id"
    t.index ["reset_password_token"], name: "index_farm_users_on_reset_password_token", unique: true
  end

  create_table "farms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.bigint "farm_timeline_id"
    t.integer "year"
    t.index ["farm_timeline_id"], name: "index_farms_on_farm_timeline_id"
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
    t.string "description"
    t.string "habitat_condition", default: ""
    t.string "ecological_connectivity", default: ""
    t.string "strategic_significance", default: ""
    t.index ["farm_id"], name: "index_hedgerows_on_farm_id"
    t.index ["hedgerow_type_id"], name: "index_hedgerows_on_hedgerow_type_id"
  end

  create_table "in_field_soil_tests", force: :cascade do |t|
    t.bigint "farm_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_in_field_soil_tests_on_farm_id"
  end

  create_table "lab_based_soil_tests", force: :cascade do |t|
    t.bigint "farm_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "increased", default: false
    t.index ["farm_id"], name: "index_lab_based_soil_tests_on_farm_id"
  end

  create_table "land_types", force: :cascade do |t|
    t.string "category"
    t.float "sequestration_per_ha", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "defra_uniqueness_score", default: 0
    t.integer "area_for_nature_rating", default: 0
    t.integer "above_ground_carbon_per_ha", default: 0
    t.string "meta_category", default: "Other"
  end

  create_table "lands", force: :cascade do |t|
    t.float "area", default: 0.0
    t.bigint "farm_id"
    t.bigint "land_type_id"
    t.boolean "sprayed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "code"
    t.string "habitat_condition", default: ""
    t.string "ecological_connectivity", default: ""
    t.string "strategic_significance", default: ""
    t.string "rotation_practice", default: ""
    t.string "tillage_method", default: ""
    t.index ["farm_id"], name: "index_lands_on_farm_id"
    t.index ["land_type_id"], name: "index_lands_on_land_type_id"
  end

  create_table "schemes_surveys", force: :cascade do |t|
    t.bigint "farm_id"
    t.boolean "sustainable_farming_incentive", default: false
    t.boolean "local_nature_recovery", default: false
    t.boolean "landscape_recovery", default: false
    t.boolean "environmental_land_management", default: false
    t.boolean "countryside_stewardship", default: false
    t.boolean "environmental_stewardship", default: false
    t.boolean "woodland_grant", default: false
    t.boolean "organic_association", default: false
    t.boolean "soil_association", default: false
    t.boolean "pasture_fed_livestock_association", default: false
    t.boolean "sustainable_wool_standard", default: false
    t.boolean "regenerative_organic_certification", default: false
    t.boolean "conservation_projects", default: false
    t.integer "conservation_projects_number", default: 0
    t.boolean "landscape_networks", default: false
    t.integer "landscape_networks_number", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["farm_id"], name: "index_schemes_surveys_on_farm_id"
  end

  create_table "soil_parcels", force: :cascade do |t|
    t.float "pH", default: 7.0
    t.float "SOC", default: 0.0
    t.float "bulk_density", default: 0.0
    t.float "soil_texture", default: 0.0
    t.float "total_soil_nitrogen", default: 0.0
    t.float "extractable_phosphorus", default: 0.0
    t.float "extractable_potassium", default: 0.0
    t.float "cation_exchange_capacity", default: 0.0
    t.float "extractable_micronutrients", default: 0.0
    t.float "active_carbon_PoXC", default: 0.0
    t.float "water_holding_capacity", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "lab_based_soil_test_id"
    t.string "name", default: "Unnamed Parcel"
    t.index ["lab_based_soil_test_id"], name: "index_soil_parcels_on_lab_based_soil_test_id"
  end

  create_table "soil_samples", force: :cascade do |t|
    t.bigint "in_field_soil_test_id"
    t.integer "compaction", default: 0
    t.integer "diversity_of_macro_life", default: 0
    t.integer "crusting", default: 0
    t.integer "ground_cover", default: 0
    t.integer "ponding", default: 0
    t.integer "plant_health", default: 0
    t.integer "root_growth", default: 0
    t.integer "aggregate_stability", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: "Unnamed Sample"
    t.string "soil_colour"
    t.string "soil_smell"
    t.string "earthworm_count"
    t.index ["in_field_soil_test_id"], name: "index_soil_samples_on_in_field_soil_test_id"
  end

  create_table "sustainability_surveys", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "farm_id"
    t.boolean "extensive_grazing_only", default: false
    t.boolean "mowing_grazing_delayed", default: false
    t.boolean "refuge_areas", default: false
    t.boolean "river_bank_vegetation_mown", default: false
    t.boolean "river_bank_vegetation_left_standing_or_mown_in_phases", default: false
    t.boolean "water_course_buffered_twelve_metres", default: false
    t.boolean "water_course_cleared_regularly", default: false
    t.boolean "dredge_cuttings_removed_promptly", default: false
    t.boolean "pond_ditches_buffered", default: false
    t.boolean "pond_bank_vegetation_mown_every_one_two_years", default: false
    t.boolean "pond_bank_vegetation_left_standing", default: false
    t.boolean "pond_plants_cleared", default: false
    t.boolean "pond_cuttings_cleared_plants_removed_promptly", default: false
    t.boolean "cover_crops", default: false
    t.boolean "intercropping", default: false
    t.boolean "minimum_tillage", default: false
    t.boolean "crop_rotations", default: false
    t.boolean "legumes_or_grass_clover_crop_rotations", default: false
    t.boolean "mulch_management", default: false
    t.boolean "green_manure", default: false
    t.boolean "integrated_pest_management", default: false
    t.boolean "local_seed_varieties", default: false
    t.boolean "avoidance_of_chemical_fertilisers_pesticides_herbicides", default: false
    t.boolean "no_irrigation", default: false
    t.boolean "overwinter_stubble", default: false
    t.boolean "winter_cover_crops", default: false
    t.boolean "flower_rich_margins", default: false
    t.boolean "four_to_six_metre_buffers_cultivated_land", default: false
    t.boolean "avoidance_of_chemical_fertilisers", default: false
    t.boolean "avoidance_of_slurry_and_mineral_fertiliser", default: false
    t.boolean "control_problem_weeds", default: false
    t.boolean "soil_and_grass_root_stock_left_intact", default: false
    t.boolean "livestock_grazed_manure_retained", default: false
    t.boolean "no_grazing_between_march_june", default: false
    t.boolean "mowing_between_july_september", default: false
    t.boolean "mowing_in_phases", default: false
    t.boolean "cuttings_removed", default: false
    t.boolean "in_field_grass_strips", default: false
    t.boolean "dead_wood_retention", default: false
    t.boolean "buffer_strips", default: false
    t.boolean "re_stocking", default: false
    t.boolean "deer_proof_fencing", default: false
    t.boolean "open_areas", default: false
    t.boolean "pond_bank_trees_shrubs_pruned_pollarded_coppiced", default: false
    t.boolean "dredged_once_twice_every_five_years_material_removed", default: false
    t.index ["farm_id"], name: "index_sustainability_surveys_on_farm_id"
  end

  create_table "targets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "ecological_focus_area"
    t.float "sustainable_practices"
    t.float "soil_health_score"
    t.bigint "estate_id"
    t.bigint "farm_id"
    t.float "mean_SOC"
    t.float "net_carbon_emission"
    t.index ["estate_id"], name: "index_targets_on_estate_id"
    t.index ["farm_id"], name: "index_targets_on_farm_id"
  end

end
