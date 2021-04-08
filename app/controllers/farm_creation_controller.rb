class FarmCreationController < ApplicationController
    include Wicked::Wizard

    steps :farm_details, :energy_details, :resource_details, :livestock_details, :land_details, :hedgerow_details,
    :biodiversity_survey_details, :sustainability_survey_details, :schemes_survey_details,
    :countryside_stewardship_survey_details, :in_field_soil_test_details, :lab_based_soil_test_details,
    :targets_details

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
        elsif params[:id] == "in_field_soil_test_details"
            redirect_to edit_farm_in_field_soil_test_path(@farm, creation: true)
        elsif params[:id] == "lab_based_soil_test_details"
            redirect_to edit_farm_lab_based_soil_test_path(@farm, creation: true)
        elsif params[:id] == "targets_details"
            redirect_to edit_farm_target_path(@farm, creation: true)
        elsif params[:id] == "schemes_survey_details"
            redirect_to edit_farm_schemes_survey_path(@farm, creation: true)
        elsif params[:id] == "countryside_stewardship_survey_details"
            redirect_to edit_farm_countryside_stewardship_survey_path(@farm, creation: true)
        else
            render_wizard
        end
    end

    def update
        @farm = Farm.find(params[:farm][:farm_id])
        @farm.update(farm_params)
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

end