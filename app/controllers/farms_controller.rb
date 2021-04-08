class FarmsController < ApplicationController
    def index
        if params[:destroy]
            farm = Farm.find(params[:farm_id])
            farm.destroy
            redirect_to farms_path
        end
        @farms = Farm.all
    end

    def create
        @farm = Farm.new(farm_params)
        if @farm.save
            redirect_to farm_creation_path(:energy_details, farm_id: @farm.id)
        else
          render :new
        end
    end

    def new
        @farm = Farm.new
        @creation = true
    end

    def show
        @farm = Farm.find(params[:id])
        redirect_to farm_snapshot_path(@farm)
        # @farm.lands.each do |land|
        #     # create if doesn't exist
        #     request.query_parameters[land.id.to_s] = 0 if !request.query_parameters[land.id.to_s]
        #     # update request.query_parameters[land.id]
        #     if request.query_parameters[:from_land_id] == land.id.to_s
        #         logger.debug "True"
        #         request.query_parameters[land.id.to_s] = request.query_parameters[land.id.to_s].to_i - 1
        #     elsif request.query_parameters[:to_land_id] == land.id.to_s
        #         logger.debug "Else"
        #         request.query_parameters[land.id.to_s] = request.query_parameters[land.id.to_s].to_i + 1
        #     end
        # end
        # @farm.perform_interventions(request.query_parameters)
    end

    def edit
        @farm = Farm.find(params[:id])
    end

    def edit_details
        @creation = params[:creation]
        @farm = Farm.find(params[:farm_id])
    end

    def edit_energy
        @farm = Farm.find(params[:farm_id])
    end

    def edit_resources
        @farm = Farm.find(params[:farm_id])
    end

    def edit_livestock
        @farm = Farm.find(params[:farm_id])
    end

    def destroy
        @farm = Farm.find(params[:id])
        @farm.destroy
        redirect_to farms_path
    end

    def update
        @farm = Farm.find(params[:id])
        @farm.update(farm_params)
        redirect_to edit_farm_path
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



# steps :farm_details, :energy_details, :resource_details, :livestock_details, :land_details, :hedgerow_details, :habitat_details, :genetic_diversity_details,
# :crop_protection_use_details, :soil_health_details, :organic_matter_details, :grassland_measures_details, :hedgerow_practices_details,
# :rivers_and_streams_details, :pools_and_ponds_details, :species_details, :targets_details