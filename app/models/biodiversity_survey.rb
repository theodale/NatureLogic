class BiodiversitySurvey < ApplicationRecord
    belongs_to :farm

    def habitat_score
        score = 0
        score += 36 if self.area_designated_for_natural_conservation > 0
        score += 2 if self.area_in_existing_agri_environment_schemes > 0
        score += 6 if self.area_of_grass_wildflower_scrub_not_for_production > 0
        score += 18 if self.farm.length_of_hedgerows > 0
        if self.wider_countryside_description ==
            "A diverse landscape, with small fields, traditional farming practices and frequent patches of natural habitat."
            score += 12
        elsif self.wider_countryside_description ==
            "An intermediate landscape, with a mix of traditional and modern farming practices and some patches of natural habitat."
            score += 6
        end
        score += 6 if self.farm.area_of("Grassland") > 0
        if self.grassland_condition ==
            "Cover of rye-grasses and white clover is less than 10% and cover of wildflowers is more than 30%."
            score += 12
        elsif self.grassland_condition ==
            "Cover of rye-grasses and white clover is less than 30% and cover of wildflowers is 10% or more."
            score += 6
        end
        score -= 6 if self.farm.area_of("Cropland") > 0
        score += 18 if (self.farm.area_of("Heathland & Scrub") + farm.area_of("Woodland")) > 9
        score += 6 if (self.farm.area_of("Heathland & Scrub") + farm.area_of("Woodland"))  > 0 and (self.farm.area_of("Heathland & Scrub") + farm.area_of("Woodland")) < 10
        score += 18 if self.farm.length_of_hedgerows > 2
        score += 6 if self.farm.length_of_hedgerows > 0 and self.farm.length_of_hedgerows < 3
        score += 18 if self.farm.tree_coverage_percentage > 9
        score += 6 if self.farm.tree_coverage_percentage > 0 and self.farm.tree_coverage_percentage < 10
        score += 18 if self.farm.ecological_focus_area_percentage > 9
        score += 6 if self.farm.ecological_focus_area_percentage > 0 and self.farm.ecological_focus_area_percentage < 10
        return score
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
        return score
    end

    def species_score
        score = 0
        score += 18 if self.threatened_species
        score += 18 if self.number_of_vascular_plant_species > 39
        score += 6 if self.number_of_vascular_plant_species < 40 and self.number_of_vascular_plant_species > 0
        score += 18 if self.number_of_wild_bee_species > 14
        score += 6 if self.number_of_wild_bee_species > 0 and self.number_of_wild_bee_species < 15
        score += 18 if self.number_of_farmland_bird_species > 29
        score += 6 if self.number_of_farmland_bird_species > 0 and self.number_of_farmland_bird_species < 30
        score += 18 if self.number_of_butterfly_species > 24
        score += 6 if self.number_of_butterfly_species > 0 and self.number_of_butterfly_species < 25
        score += 18 if self.number_of_mammal_species > 9
        score += 6 if self.number_of_mammal_species > 0 and self.number_of_mammal_species < 10
        return score
    end

    def biodiversity_percentage_score
        total_score = self.habitat_score + genetic_diversity_score + species_score
        return (total_score * 100 / 284.0).round(0)
    end

    def habitat_percentage_score
        return (100 * habitat_score / 146.0).round(1)
    end

    def genetic_diversity_percentage_score
        return (100 * genetic_diversity_score / 30.0).round(1)
    end

    def species_percentage_score
        return (100 * species_score / 108.0).round(1)
    end

end
