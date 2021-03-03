class AddManagementPracticesToBiodiversitySurveys < ActiveRecord::Migration[6.0]
  def change

    add_column :biodiversity_surveys, :crop_protection_use, :boolean, default: false

    add_column :biodiversity_surveys, :legumes_or_grass_cover_in_crop_rotation, :boolean, default: false
    add_column :biodiversity_surveys, :grow_cover_crops, :boolean, default: false
    add_column :biodiversity_surveys, :grow_three_cover_crops, :boolean, default: false
    add_column :biodiversity_surveys, :soil_covered_cereal_grass_or_cover_crops, :boolean, default: false
    add_column :biodiversity_surveys, :shallow_tillage, :boolean, default: false
    add_column :biodiversity_surveys, :no_tillage, :boolean, default: false
    add_column :biodiversity_surveys, :conventional_tillage, :boolean, default: false
    add_column :biodiversity_surveys, :no_soil_health_measures, :boolean, default: true

    add_column :biodiversity_surveys, :solid_manure, :boolean, default: false
    add_column :biodiversity_surveys, :compost, :boolean, default: false
    add_column :biodiversity_surveys, :residues_not_removed, :boolean, default: false
    add_column :biodiversity_surveys, :grass_mix_incorporated, :boolean, default: false
    add_column :biodiversity_surveys, :organic_fertilizers_in_response, :boolean, default: false
    add_column :biodiversity_surveys, :no_organic_matter, :boolean, default: true

    add_column :biodiversity_surveys, :slurry_mineral_fertilizer_not_used, :boolean, default: false
    add_column :biodiversity_surveys, :bird_nests_marked, :boolean, default: false
    add_column :biodiversity_surveys, :extensive_grazing_only, :boolean, default: false
    add_column :biodiversity_surveys, :mowing_grazing_delayed, :boolean, default: false
    add_column :biodiversity_surveys, :refuge_areas, :boolean, default: false
    add_column :biodiversity_surveys, :no_grassland_measures, :boolean, default: true

    add_column :biodiversity_surveys, :hedgerows_pruned_three_years, :boolean, default: false
    add_column :biodiversity_surveys, :hedgerow_grass_margin, :boolean, default: false
    add_column :biodiversity_surveys, :no_hedgerows, :boolean, default: true

    add_column :biodiversity_surveys, :water_courses, :boolean, default: false
    add_column :biodiversity_surveys, :river_bank_vegetation_mowed_two_years, :boolean, default: false
    add_column :biodiversity_surveys, :river_bank_vegetation_left_standing, :boolean, default: false
    add_column :biodiversity_surveys, :water_course_buffered_twelve_metres, :boolean, default: false
    add_column :biodiversity_surveys, :water_course_cleared_regularly, :boolean, default: false
    add_column :biodiversity_surveys, :dredge_cuttings_removed_promptly, :boolean, default: false
    add_column :biodiversity_surveys, :no_water_courses, :boolean, default: true

    add_column :biodiversity_surveys, :pools_and_ponds, :boolean, default: false
    add_column :biodiversity_surveys, :pond_ditches_buffered, :boolean, default: false
    add_column :biodiversity_surveys, :pond_bank_vegetation_mowed_two_years, :boolean, default: false
    add_column :biodiversity_surveys, :pond_bank_vegetation_left_standing, :boolean, default: false
    add_column :biodiversity_surveys, :pond_plants_cleared_three_years, :boolean, default: false
    add_column :biodiversity_surveys, :pond_cuttings_removed_promptly, :boolean, default: false
    add_column :biodiversity_surveys, :pond_dredged_five_years, :boolean, default: false
    add_column :biodiversity_surveys, :pond_shading_prevented, :boolean, default: false
    add_column :biodiversity_surveys, :no_pools_and_ponds, :boolean, default: true

  end
end
