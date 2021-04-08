class SustainabilitySurveysController < ApplicationController

    def edit
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        if @farm.sustainability_survey
            @sustainability_survey = @farm.sustainability_survey
        else
            @sustainability_survey = @farm.build_sustainability_survey
        end
    end

    def update
        @farm = Farm.find(params[:farm_id])
        if @farm.sustainability_survey
            @farm.sustainability_survey.update(sustainability_survey_params)
        else
            @farm.create_sustainability_survey(sustainability_survey_params)
        end
        if params[:creation]
            redirect_to farm_creation_path(:schemes_survey_details, farm_id: @farm.id)
        else
            redirect_to edit_farm_path(@farm)
        end
    end

    private

    def sustainability_survey_params
        params.require(:sustainability_survey).permit(
            :crop_protection_use,
            :legumes_or_grass_cover_in_crop_rotation,
            :grow_cover_crops,
            :soil_covered_cereal_grass_or_cover_crops,
            :shallow_tillage,
            :no_tillage,
            :conventional_tillage,
            :no_soil_health_measures,
            :solid_manure,
            :compost,
            :residues_not_removed,
            :grass_mix_incorporated,
            :organic_fertilizers_in_response,
            :no_organic_matter,
            :slurry_mineral_fertilizer_not_used,
            :bird_nests_marked,
            :extensive_grazing_only,
            :mowing_grazing_delayed,
            :refuge_areas,
            :no_grassland_measures,
            :hedgerows_pruned_three_years,
            :no_hedgerows,
            :water_courses,
            :river_bank_vegetation_mowed_two_years,
            :river_bank_vegetation_left_standing,
            :water_course_buffered_twelve_metres,
            :water_course_cleared_regularly,
            :dredge_cuttings_removed_promptly,
            :no_water_courses,
            :pools_and_ponds,
            :pond_ditches_buffered,
            :pond_bank_vegetation_mowed_two_years,
            :pond_bank_vegetation_left_standing,
            :pond_plants_cleared_three_years,
            :pond_cuttings_removed_promptly,
            :pond_dredged_five_years,
            :pond_shading_prevented,
            :no_pools_and_ponds
        )
    end

end

