class FarmsController < ApplicationController

    def create
        if params[:estate]
            @farm = Farm.create(farm_params.merge(estate_id: current_estate_user.estate.id))
            redirect_to estate_path(current_estate_user.estate)
        else
            @farm = Farm.create(farm_user_id: current_farm_user.id)
            redirect_to farm_creation_path(:start, farm_id: @farm.id)
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
        @farm = Farm.find(params[:farm_id])
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

    before_action :get_farm_from_farm_id, only: [
        :snapshot, :carbon, :energy, :nature, :soil,
        :sustainability, :strategy, :profile,
        :edit_details, :edit_energy, :edit_resources,
        :edit_livestock
    ]

    # Display

    def snapshot
    end

    def carbon
    end

    def energy
    end

    def nature
    end

    def soil
    end

    def sustainability
    end

    def strategy
    end

    def profile
    end

    # Edit

    def edit_details
    end

    def edit_energy
    end

    def edit_resources
    end

    def edit_livestock
    end

    private

    def get_farm_from_farm_id
        @farm = Farm.find(params[:farm_id])
    end

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
