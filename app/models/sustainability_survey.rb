class SustainabilitySurvey < ApplicationRecord
  belongs_to :farm

  def sustainable_practice_score
    20

    # score =
    #     ( to_int (self.crop_protection_use) ) +
    #     ( to_int (self.grow_cover_crops) ) +
    #     ( to_int (self.grow_three_cover_crops) ) +
    #     ( to_int (self.soil_covered_cereal_grass_or_cover_crops) ) +
    #     ( to_int (self.shallow_tillage) ) +
    #     ( to_int (self.no_tillage) ) +
    #     ( to_int (self.conventional_tillage) ) +
    #     ( to_int (self.no_soil_health_measures) ) +
    #     ( to_int (self.solid_manure) ) +
    #     ( to_int (self.compost) ) +
    #     ( to_int (self.residues_not_removed) ) +
    #     ( to_int (self.grass_mix_incorporated) ) +
    #     ( to_int (self.organic_fertilizers_in_response) ) +
    #     ( to_int (self.no_organic_matter) ) +
    #     ( to_int (self.slurry_mineral_fertilizer_not_used) ) +
    #     ( to_int (self.bird_nests_marked) ) +
    #     ( to_int (self.extensive_grazing_only) ) +
    #     ( to_int (self.mowing_grazing_delayed) ) +
    #     ( to_int (self.refuge_areas) ) +
    #     ( to_int (self.no_grassland_measures) ) +
    #     ( to_int (self.hedgerows_pruned_three_years) ) +
    #     ( to_int (self.hedgerow_grass_margin) ) +
    #     ( to_int (self.no_hedgerows) ) +
    #     ( to_int (self.water_courses) ) +
    #     ( to_int (self.river_bank_vegetation_mowed_two_years) ) +
    #     ( to_int (self.river_bank_vegetation_left_standing) ) +
    #     ( to_int (self.water_course_buffered_twelve_metres) ) +
    #     ( to_int (self.water_course_cleared_regularly) ) +
    #     ( to_int (self.dredge_cuttings_removed_promptly) ) +
    #     ( to_int (self.no_water_courses) ) +
    #     ( to_int (self.pools_and_ponds) ) +
    #     ( to_int (self.pond_ditches_buffered) ) +
    #     ( to_int (self.pond_bank_vegetation_mowed_two_years) ) +
    #     ( to_int (self.pond_bank_vegetation_left_standing) ) +
    #     ( to_int (self.pond_plants_cleared_three_years) ) +
    #     ( to_int (self.pond_cuttings_removed_promptly) ) +
    #     ( to_int (self.pond_dredged_five_years) ) +
    #     ( to_int (self.pond_shading_prevented) ) +
    #     ( to_int (self.no_pools_and_ponds ) )
    # return score
  end

  def sustainable_practice_percentage_score
    (100 * sustainable_practice_score / 39.0).round(1)
  end

  private

  def to_int(boolean)
    if boolean
      1
    else
      0
    end
  end
end
