class UpdateSustainabilititySurveys < ActiveRecord::Migration[6.0]
  def change
    remove_column :sustainability_surveys, :grow_cover_crops
    remove_column :sustainability_surveys, :grow_three_cover_crops
    remove_column :sustainability_surveys, :crop_protection_use
    remove_column :sustainability_surveys, :legumes_or_grass_cover_in_crop_rotation
    remove_column :sustainability_surveys, :soil_covered_cereal_grass_or_cover_crops
    remove_column :sustainability_surveys, :shallow_tillage
    remove_column :sustainability_surveys, :no_tillage
    remove_column :sustainability_surveys, :conventional_tillage
    remove_column :sustainability_surveys, :no_soil_health_measures
    remove_column :sustainability_surveys, :solid_manure
    remove_column :sustainability_surveys, :compost
    remove_column :sustainability_surveys, :residues_not_removed
    remove_column :sustainability_surveys, :grass_mix_incorporated
    remove_column :sustainability_surveys, :organic_fertilizers_in_response
    remove_column :sustainability_surveys, :no_organic_matter
    remove_column :sustainability_surveys, :slurry_mineral_fertilizer_not_used
    remove_column :sustainability_surveys, :bird_nests_marked
    remove_column :sustainability_surveys, :no_grassland_measures
    remove_column :sustainability_surveys, :hedgerows_pruned_three_years
    remove_column :sustainability_surveys, :hedgerow_grass_margin
    remove_column :sustainability_surveys, :no_hedgerows
    remove_column :sustainability_surveys, :water_courses
    remove_column :sustainability_surveys, :no_water_courses
    remove_column :sustainability_surveys, :pools_and_ponds
    remove_column :sustainability_surveys, :pond_dredged_five_years
    remove_column :sustainability_surveys, :pond_shading_prevented
    remove_column :sustainability_surveys, :no_pools_and_ponds

    # cropland

    add_column :sustainability_surveys, :cover_crops, :boolean, default: false
    add_column :sustainability_surveys, :intercropping, :boolean, default: false
    add_column :sustainability_surveys, :minimum_tillage, :boolean, default: false
    add_column :sustainability_surveys, :crop_rotations, :boolean, default: false
    add_column :sustainability_surveys, :legumes_or_grass_clover_crop_rotations, :boolean, default: false
    add_column :sustainability_surveys, :mulch_management, :boolean, default: false
    add_column :sustainability_surveys, :green_manure, :boolean, default: false
    add_column :sustainability_surveys, :integrated_pest_management, :boolean, default: false
    add_column :sustainability_surveys, :local_seed_varieties, :boolean, default: false
    add_column :sustainability_surveys, :avoidance_of_chemical_fertilisers_pesticides_herbicides, :boolean,
               default: false
    add_column :sustainability_surveys, :no_irrigation, :boolean, default: false
    add_column :sustainability_surveys, :overwinter_stubble, :boolean, default: false
    add_column :sustainability_surveys, :winter_cover_crops, :boolean, default: false
    add_column :sustainability_surveys, :flower_rich_margins, :boolean, default: false
    add_column :sustainability_surveys, :four_to_six_metre_buffers_cultivated_land, :boolean, default: false

    # grassland

    add_column :sustainability_surveys, :avoidance_of_chemical_fertilisers, :boolean, default: false
    add_column :sustainability_surveys, :avoidance_of_slurry_and_mineral_fertiliser, :boolean, default: false
    add_column :sustainability_surveys, :control_problem_weeds, :boolean, default: false
    add_column :sustainability_surveys, :soil_and_grass_root_stock_left_intact, :boolean, default: false
    add_column :sustainability_surveys, :livestock_grazed_manure_retained, :boolean, default: false
    add_column :sustainability_surveys, :no_grazing_between_march_june, :boolean, default: false
    add_column :sustainability_surveys, :mowing_between_july_september, :boolean, default: false
    add_column :sustainability_surveys, :mowing_in_phases, :boolean, default: false
    add_column :sustainability_surveys, :cuttings_removed, :boolean, default: false
    add_column :sustainability_surveys, :in_field_grass_strips, :boolean, default: false

    # woodland

    add_column :sustainability_surveys, :dead_wood_retention, :boolean, default: false
    add_column :sustainability_surveys, :buffer_strips, :boolean, default: false
    add_column :sustainability_surveys, :re_stocking, :boolean, default: false
    add_column :sustainability_surveys, :deer_proof_fencing, :boolean, default: false
    add_column :sustainability_surveys, :open_areas, :boolean, default: false

    # rivers and streams

    rename_column :sustainability_surveys, :river_bank_vegetation_mowed_two_years, :river_bank_vegetation_mown
    rename_column :sustainability_surveys, :river_bank_vegetation_left_standing,
                  :river_bank_vegetation_left_standing_or_mown_in_phases

    # pools and ponds

    rename_column :sustainability_surveys, :pond_bank_vegetation_mowed_two_years,
                  :pond_bank_vegetation_mown_every_one_two_years
    add_column :sustainability_surveys, :pond_bank_trees_shrubs_pruned_pollarded_coppiced, :boolean, default: false
    rename_column :sustainability_surveys, :pond_plants_cleared_three_years, :pond_plants_cleared
    rename_column :sustainability_surveys, :pond_cuttings_removed_promptly,
                  :pond_cuttings_cleared_plants_removed_promptly
    add_column :sustainability_surveys, :dredged_once_twice_every_five_years_material_removed, :boolean, default: false
  end
end
