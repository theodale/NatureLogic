class FarmsController < ApplicationController

    #estate -> add_farm, create_farm in estates controller
    #farm -> farm_creation_controller with new_farm = true

    def index
        @farms = Farm.all
    end

    def new
        @farm = Farm.new
        @creation = true
    end

    def create
        @farm = Farm.new(farm_params)
        if @farm.save
            redirect_to farm_creation_path(:start, request.params)
        else
          render :new
        end
    end

    def show
        @farm = Farm.find(params[:id])
        if @farm.created
            redirect_to farm_snapshot_path(@farm)
        else
            redirect_to farm_creation_path(:start, farm_id: @farm.id)
        end
    end

    def edit
        @farm = Farm.find(params[:id])
    end

    def update
        @farm = Farm.find(params[:id])
        @farm.update(farm_params)
        if params[:from_profile]
            redirect_to farm_profile_path
        else
            redirect_to edit_farm_path
        end
    end

    def destroy
        @farm = Farm.find(params[:id])
        @farm.destroy
        redirect_to farms_path
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
