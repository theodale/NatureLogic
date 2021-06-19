class TargetsController < ApplicationController

    def edit
        if params[:farm_target]
            @farm = Farm.find(params[:farm_id])
            @target = @farm.target
        else
            @estate = Estate.find(params[:estate_id])
            if @estate.target
                @target = @estate.target
            else
                @target = @estate.build_target
            end
        end
    end

    def update
        if params[:farm_target]
            @farm = Farm.find(params[:farm_id])
            @farm.target.update(targets_params)
            redirect_to edit_farm_path(@farm)
        else
            @estate = Estate.find(params[:estate_id])
            @estate.target.update(targets_params)
            redirect_to edit_estate_target_path(@estate, updated: true)
        end
    end

    private

    def targets_params
        params.require(:target).permit(
            :net_carbon_emission,
            :mean_SOC,
            :soil_health,
            :nature_positive_areas,
            :sustainable_practices
        )
    end

end
