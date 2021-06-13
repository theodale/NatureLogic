class TargetsController < ApplicationController

    def edit
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        if @farm.target
            @target = @farm.target
        else
            @target = @farm.build_target
        end
    end

    def update
        if params[:estate]
            @estate = Estate.find(params[:estate_id])
            @estate.target.update(targets_params)
            redirect_to estate_settings_targets_path(@estate, updated: true)
        else
            @farm = Farm.find(params[:farm_id])
            if @farm.target
                @farm.target.update(targets_params)
            else
                @farm.create_target(targets_params)
            end
            redirect_to edit_farm_path(@farm)
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
