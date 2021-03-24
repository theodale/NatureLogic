class FarmCreationController < ApplicationController
    include Wicked::Wizard

    steps :farm_details, :energy_details, :resource_details, :livestock_details, :land_details, :hedgerow_details,
    :biodiversity_survey_details, :sustainability_survey_details, :targets_details

    # :habitat_details, :genetic_diversity_details,
    # :crop_protection_use_details, :soil_health_details, :organic_matter_details, :grassland_measures_details, :hedgerow_practices_details,
    # :rivers_and_streams_details, :pools_and_ponds_details, :species_details, :targets_details

    def show
        @farm = Farm.find(params[:farm_id])
        if params[:id] == "land_details"
            redirect_to farm_lands_path(@farm, creation: true)
        elsif params[:id] == "hedgerow_details"
            redirect_to farm_hedgerows_path(@farm, creation: true)
        elsif params[:id] == "biodiversity_survey_details"
            redirect_to edit_farm_biodiversity_survey_path(@farm, creation: true)
        elsif params[:id] == "sustainability_survey_details"
            redirect_to edit_farm_sustainability_survey_path(@farm, creation: true)
        else
            # if params[:id] == "targets_details"
            #     @target = Target.new
            # elsif params[:id] == "habitat_details"
            #     @biodiversity_survey = BiodiversitySurvey.new
            # elsif update_biodiversity_survey?
            #     @biodiversity_survey = BiodiversitySurvey.find(params[:biodiversity_survey_id])
            # end
            render_wizard
        end
    end

    def update
        @farm = Farm.find(params[:farm][:farm_id])
        @farm.update(farm_params) #new
        # @farm.update(creation_params.except(:farm_id))
        redirect_to wizard_path(next_step, farm_id: @farm.id)
    end

    private

    def farm_params
        params.require(:farm).permit(
            :name,
            :location,
            :latitude,
            :longitude,
            :total_diesel_use,
            :total_gas_use,
            :total_electricity_use,
            :artificial_fertiliser_use,
            :agriculture_products_spend,
            :wood_and_wood_products_spend,
            :pesticides_spend,
            :machinery_and_equipment_spend,
            :other_spend,
            :number_of_sheep,
            :number_of_cows
        )
    end

    def creation_params
        params.require(:farm).permit!
    end

    def target_params
        params.require(:target).permit!
    end

    def biodiversity_survey_params
        params.require(:biodiversity_survey).permit!
    end

end