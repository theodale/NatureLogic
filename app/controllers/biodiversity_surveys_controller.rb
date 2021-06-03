class BiodiversitySurveysController < ApplicationController

    def edit
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        if @farm.biodiversity_survey
            @biodiversity_survey = @farm.biodiversity_survey
        else
            @biodiversity_survey = @farm.build_biodiversity_survey
        end
    end

    def update
        @farm = Farm.find(params[:farm_id])
        if @farm.biodiversity_survey
            @farm.biodiversity_survey.update(biodiversity_survey_params)
        else
            @farm.create_biodiversity_survey(biodiversity_survey_params)
        end
        if params[:creation]
            redirect_to farm_creation_path(:sustainability_surveys, farm_id: @farm.id)
        else
            redirect_to edit_farm_path(@farm)
        end
    end

    private

    def biodiversity_survey_params
        params.require(:biodiversity_survey).permit(
            :area_designated_for_natural_conservation,
            :area_in_existing_agri_environment_schemes,
            :area_of_grass_wildflower_scrub_not_for_production,
            :wider_countryside_description,
            :number_of_crop_types,
            :number_of_heritage_crops,
            :number_of_livestock_breeds,
            :number_of_rare_breeds
        )
    end

end


