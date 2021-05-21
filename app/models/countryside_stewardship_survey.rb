class CountrysideStewardshipSurvey < ApplicationRecord
    belongs_to :farm

    def payments
        total = 0
        total += 511 if self.nectar_flower_mix
        total += 539 if self.flower_rich_margins_and_plots
        total += 18 if self.skylark_plots
        total += 524 if self.nesting_plots_for_lapwing_and_stone_curlew
        total += 436 if self.enhanced_overwinter_stubble
        total += 632 if self.supplementary_winter_feeding_for_farmland_birds
        total += 550 if self.autumn_sown_bumblebird_mix
        total += 100 if self.brassica_fodder_crop
        total += 114 if self.winter_cover_crops
        total += 311 if self.arable_reversion_to_grassland_with_low_fertilizer_input
        total += 353 if self.small_buffer_strip_on_cultivated_land
        total += 512 if self.large_buffer_strip_on_cultivated_land
        total += 557 if self.in_field_grass_strips
        total += 365 if self.field_corners_out_of_production
        total += 44 if self.lenient_grazing_supplement
        total += 170 if self.buffer_strip_on_intensive_grassland
        total += 202 if self.management_of_intensive_grassland_adjacent_to_watercourse
        total += 88 if self.seasonal_livestock_removal_on_intensive_grassland
        total += 50 if self.management_of_hedgerows
        total += 10 if self.hedgerow_gapping_up
        total += 12 if self.planting_new_hedges
        total += 270 if self.pond_management
        total += 501 if self.buffering_in_field_ponds_and_ditches_on_arable_land
        # No payment data for tree planting
        # total +=  if self.tree_planting
        return total
    end

    def percentage_completion
        total = 0
        attributes = self.attributes.except(
            "farm_id",
            "id",
            "created_at",
            "updated_at"
        )
        attributes.each do |key, value|
            if value
                total += 1
            end
        end
        return (100 * total / attributes.size.to_f).round(1)
    end

end
