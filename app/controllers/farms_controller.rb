class FarmsController < ApplicationController
    def index
        @farms = Farm.all
    end

    def create
        @farm = Farm.new(farm_params)
        if @farm.save
          redirect_to @farm
        else
          render :new
        end
    end

    def new
        @farm = Farm.new
        @farm.build_target
        @farm.lands.build
    end

    def show
        @farm = Farm.find(params[:id])
    end

    private

    def farm_params
        params.require(:farm).permit!
        # (
        #     :name,
        #     :location,
        #     :latitude,
        #     :longitude,
        #     :total_diesel_use,
        #     :total_gas_use,
        #     :total_electricity_use,
        #     :artificial_fertiliser_use,
        #     :agriculture_products_spend,
        #     :wood_and_wood_products_spend,
        #     :pesticides_spend,
        #     :machinery_and_equipment_spend,
        #     :other_spend,
        #     :number_of_sheep,
        #     :number_of_cows,
        #     target_attributes: [
        #         :net_carbon_emission,
        #         :defra_habitat_score,
        #         :space_for_nature_score,
        #         :countryside_stewardship_score,
        #         :biodiversity_score,
        #         :field_based_soil_health_score,
        #         :lab_based_soil_health_score,
        #         :mean_SOC,
        #     ]
        # )
    end
end
