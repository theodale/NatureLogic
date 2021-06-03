class FarmCreationController < ApplicationController
    include Wicked::Wizard

    steps :start, :details, :energy, :resources, :livestock, :lands, :hedgerows,
    :biodiversity_surveys, :sustainability_surveys, :targets

    def show
        @farm = Farm.find(params[:farm_id])
        if params[:id] == "lands"
            redirect_to farm_lands_path(@farm, creation: true)
        elsif params[:id] == "hedgerows"
            redirect_to farm_hedgerows_path(@farm, creation: true)
        elsif params[:id] == "biodiversity_surveys"
            redirect_to edit_farm_biodiversity_survey_path(@farm, creation: true)
        elsif params[:id] == "sustainability_surveys"
            redirect_to edit_farm_sustainability_survey_path(@farm, creation: true)
        elsif params[:id] == "targets"
            redirect_to edit_farm_target_path(@farm, creation: true)
        else
            render_wizard
        end
    end

    def update
        farm = Farm.find(params[:farm_id])
        farm.update(farm_params)
        redirect_to wizard_path(
            next_step,
            farm_id: farm.id
        )
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