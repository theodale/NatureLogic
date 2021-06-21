class RemovePracticesFromBiodiversitySurveys < ActiveRecord::Migration[6.0]
  def change
    remove_column :biodiversity_surveys, :crop_protection_use
    remove_column :biodiversity_surveys, :legumes_or_grass_cover_in_crop_rotation
    remove_column :biodiversity_surveys, :grow_cover_crops
    remove_column :biodiversity_surveys, :grow_three_cover_crops
    remove_column :biodiversity_surveys, :soil_covered_cereal_grass_or_cover_crops
    remove_column :biodiversity_surveys, :shallow_tillage
    remove_column :biodiversity_surveys, :no_tillage
    remove_column :biodiversity_surveys, :conventional_tillage
    remove_column :biodiversity_surveys, :no_soil_health_measures
    remove_column :biodiversity_surveys, :solid_manure
    remove_column :biodiversity_surveys, :compost
    remove_column :biodiversity_surveys, :residues_not_removed
    remove_column :biodiversity_surveys, :grass_mix_incorporated
    remove_column :biodiversity_surveys, :organic_fertilizers_in_response
    remove_column :biodiversity_surveys, :no_organic_matter
    remove_column :biodiversity_surveys, :slurry_mineral_fertilizer_not_used
    remove_column :biodiversity_surveys, :bird_nests_marked
    remove_column :biodiversity_surveys, :extensive_grazing_only
    remove_column :biodiversity_surveys, :mowing_grazing_delayed
    remove_column :biodiversity_surveys, :refuge_areas
    remove_column :biodiversity_surveys, :no_grassland_measures
    remove_column :biodiversity_surveys, :hedgerows_pruned_three_years
    remove_column :biodiversity_surveys, :hedgerow_grass_margin
    remove_column :biodiversity_surveys, :no_hedgerows
    remove_column :biodiversity_surveys, :water_courses
    remove_column :biodiversity_surveys, :river_bank_vegetation_mowed_two_years
    remove_column :biodiversity_surveys, :river_bank_vegetation_left_standing
    remove_column :biodiversity_surveys, :water_course_buffered_twelve_metres
    remove_column :biodiversity_surveys, :water_course_cleared_regularly
    remove_column :biodiversity_surveys, :dredge_cuttings_removed_promptly
    remove_column :biodiversity_surveys, :no_water_courses
    remove_column :biodiversity_surveys, :pools_and_ponds
    remove_column :biodiversity_surveys, :pond_ditches_buffered
    remove_column :biodiversity_surveys, :pond_bank_vegetation_mowed_two_years
    remove_column :biodiversity_surveys, :pond_bank_vegetation_left_standing
    remove_column :biodiversity_surveys, :pond_plants_cleared_three_years
    remove_column :biodiversity_surveys, :pond_cuttings_removed_promptly
    remove_column :biodiversity_surveys, :pond_dredged_five_years
    remove_column :biodiversity_surveys, :pond_shading_prevented
    remove_column :biodiversity_surveys, :no_pools_and_ponds
    remove_column :biodiversity_surveys, :number_of_merino
    remove_column :biodiversity_surveys, :number_of_rambouillet
    remove_column :biodiversity_surveys, :number_of_blue_faced_leicester
    remove_column :biodiversity_surveys, :number_of_corridale
    remove_column :biodiversity_surveys, :number_of_columbia
    remove_column :biodiversity_surveys, :number_of_suffolk
    remove_column :biodiversity_surveys, :number_of_dohne
    remove_column :biodiversity_surveys, :number_of_poll_dorset
    remove_column :biodiversity_surveys, :number_of_composites
  end
end