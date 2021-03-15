class BiodiversitySurvey < ApplicationRecord
    belongs_to :farm

    def habitat_score
        score = 0
        score += 36 if self.area_designated_for_natural_conservation > 0
        score += 2 if self.area_in_existing_agri_environment_schemes > 0
        score += 6 if self.area_of_grass_wildflower_scrub_not_for_production > 0
        score += 18 if self.farm.length_of_hedgerows > 0
        score += self.wider_countryside_description
        score
    end

    def genetic_diversity_score
        score = 0
        score += 3 if self.number_of_crop_types > 0 and self.number_of_crop_types < 4
        score += 6 if self.number_of_crop_types > 3 and self.number_of_crop_types < 7
        score += 12 if self.number_of_crop_types > 6
        score += 6 if self.number_of_heritage_crops > 0
        score += 3 if self.number_of_livestock_breeds == 1
        score += 6 if self.number_of_livestock_breeds > 1
        score += 6 if self.number_of_rare_breeds > 1
        score
    end

    def management_practices_score
        score = 0

        if self.crop_protection_use
            score += 5
        else
            score -= 15
        end

        if self.shallow_tillage || self.no_tillage
            score += 3
        elsif self.legumes_or_grass_cover_in_crop_rotation || self.grow_cover_crops || self.grow_three_cover_crops || self.soil_covered_cereal_grass_or_cover_crops
            score += 2
        elsif self.no_soil_health_measures
            score -= 4
        elsif self.conventional_tillage
            score -= 5
        end

        if self.solid_manure || self.compost
            score += 7
        elsif self.residues_not_removed || self.grass_mix_incorporated || self.organic_fertilizers_in_response
            score += 2
        end

        if self.slurry_mineral_fertilizer_not_used || self.mowing_grazing_delayed
            score += 4
        elsif self.bird_nests_marked || self.refuge_areas || self.extensive_grazing_only
            score += 2
        end

        if self.hedgerows_pruned_three_years || self.hedgerow_grass_margin
            score += 2
        end

        if self.river_bank_vegetation_mowed_two_years
            score += 4
        elsif self.water_courses || self.river_bank_vegetation_left_standing || self.water_course_buffered_twelve_metres ||
            self.water_course_cleared_regularly || self.dredge_cuttings_removed_promptly
            score += 2
        end

        if self.pools_and_ponds || self.pond_ditches_buffered || self.pond_bank_vegetation_mowed_two_years ||
            self.pond_bank_vegetation_left_standing || self.pond_plants_cleared_three_years ||
            self.pond_cuttings_removed_promptly || self.pond_dredged_five_years || self.pond_shading_prevented
            score += 2
        end
        score
    end

    def species_score
        score = 0
        score += 5 if self.threatened_species
        score += 2 if self.number_of_vascular_plant_species > 0
        score += 2 if self.number_of_wild_bee_species > 0
        score += 2 if self.number_of_farmland_bird_species > 0
        score += 2 if self.number_of_butterfly_species > 0
        score += 2 if self.number_of_mammal_species > 0
        score
    end

    def biodiversity_score
        (((habitat_score + management_practices_score + genetic_diversity_score + species_score).to_f / 227.0) * 100).round(1)
    end
end
