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
        @farm = Farm.find(params[:farm_id])
        if @farm.target
            @farm.target.update(targets_params)
        else
            @farm.create_target(targets_params)
        end
        if params[:creation]
            @farm.update({created: true})
            redirect_to farm_snapshot_path(@farm)
        else
            redirect_to edit_farm_path(@farm)
        end
    end

    private

    def targets_params
        params.require(:target).permit(
            :net_carbon_emission,
            :defra_habitat_score,
            :space_for_nature_score,
            :countryside_stewardship_score,
            :biodiversity_score,
            :field_based_soil_health_score,
            :lab_based_soil_health_score,
            :mean_SOC
        )
    end

end
