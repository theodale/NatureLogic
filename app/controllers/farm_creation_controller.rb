class FarmCreationController < ApplicationController
    include Wicked::Wizard

    steps :energy_details, :resource_details, :livestock_details, :land_details, :hedgerow_details, :habitat_details, :genetic_diversity_details,
    :crop_protection_use_details, :soil_health_details, :organic_matter_details, :grassland_measures_details, :hedgerow_practices_details,
    :rivers_and_streams_details, :pools_and_ponds_details, :species_details, :targets_details

    def show
        @farm = Farm.find(params[:farm_id])
        if params[:id] == "land_details"
            @farm.lands.build
        elsif params[:id] == "hedgerow_details"
            @farm.hedgerows.build
        elsif params[:id] == "targets_details"
            @target = Target.new
        elsif params[:id] == "habitat_details"
            @biodiversity_survey = BiodiversitySurvey.new
        elsif update_biodiversity_survey?
            @biodiversity_survey = BiodiversitySurvey.find(params[:biodiversity_survey_id])
        end
        render_wizard
    end

    def update
        if params[:id] == "targets_details"
            @target = Target.new(target_params)
            @target.save
            @farm = Farm.find(target_params[:farm_id])
            redirect_to farm_path(@farm)
        elsif params[:id] == "habitat_details"
            @biodiversity_survey = BiodiversitySurvey.new(biodiversity_survey_params)
            @biodiversity_survey.save
            @farm = Farm.find(biodiversity_survey_params[:farm_id])
            redirect_to wizard_path(next_step, farm_id: @farm.id, biodiversity_survey_id: @biodiversity_survey.id)
        elsif update_biodiversity_survey?
            @farm = Farm.find(params[:biodiversity_survey][:farm_id])
            @biodiversity_survey = BiodiversitySurvey.find(params[:biodiversity_survey][:biodiversity_survey_id])
            @biodiversity_survey.update(biodiversity_survey_params.except(:farm_id, :biodiversity_survey_id))
            redirect_to wizard_path(next_step, farm_id: @farm.id, biodiversity_survey_id: @biodiversity_survey.id)
        else
            @farm = Farm.find(params[:farm][:farm_id])
            if params[:id] == "land_details"
                creation_params[:lands_attributes].each do |key, value|
                    @land = Land.new(value.merge(farm_id: @farm.id))
                    @land.save
                end
            elsif params[:id] == "hedgerow_details"
                creation_params[:hedgerows_attributes].each do |key, value|
                    @hedgerow = Hedgerow.new(value.merge(farm_id: @farm.id))
                    @hedgerow.save
                end
            else
                @farm.update(creation_params.except(:farm_id))
            end
            redirect_to wizard_path(next_step, farm_id: @farm.id)
        end
    end

    private

    def creation_params
        params.require(:farm).permit!
    end

    def target_params
        params.require(:target).permit!
    end

    def biodiversity_survey_params
        params.require(:biodiversity_survey).permit!
    end

    def update_biodiversity_survey?
        if  params[:id] == "genetic_diversity_details" ||
            params[:id] == "crop_protection_use_details" ||
            params[:id] == "soil_health_details" ||
            params[:id] == "organic_matter_details" ||
            params[:id] == "grassland_measures_details" ||
            params[:id] == "hedgerow_practices_details" ||
            params[:id] == "rivers_and_streams_details" ||
            params[:id] == "pools_and_ponds_details" ||
            params[:id] == "species_details"
            true
        else
            false
        end
    end

end
