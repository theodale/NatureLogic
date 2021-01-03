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
    end

    def show
        @farm = Farm.find(params[:id])
    end

    private

    def farm_params
        params.require(:farm).permit(
            :name,
            :location,
            :latitude,
            :longitude,
            :farm_area,
            :pasture_area,
            :crop_area,
            :hedgerow_area,
            :woodland_area,
            :set_aside_1yr_area,
            :set_aside_1yr_to_5yr_area,
            :set_aside_5yr_area,
            :diesel_use,
            :gas_use,
            :electricity_use,
            :sheep,
            :cows,
            :tillage_area,
            :sprayage_area,
            :artificial_fertiliser_applied,
            :annual_applied_pesticide,
            :annual_applied_herbicide,
            :annual_applied_fungicide,
            :organic, :machinery_spend,
            :labour_spend,
            :feed_spend,
            :non_fuel_spend
        )
    end
end
