class FarmCreationController < ApplicationController
    include Wicked::Wizard

    steps :energy_details, :resource_details, :livestock_details, :land_details, :hedgerow_details, :targets_details

    def show
        @farm = Farm.find(params[:farm_id])
        if params[:id] == "land_details"
            @farm.lands.build
        elsif params[:id] == "hedgerow_details"
            @farm.hedgerows.build
        elsif params[:id] == "targets_details"
            @target = Target.new
        end
        render_wizard
    end

    def update
        if params[:id] == "targets_details"
            logger.debug "TRUE"
            @target = Target.new(target_params)
            @target.save
            @farm = Farm.find(target_params[:farm_id])
            redirect_to farm_path(@farm)
        else
            @farm = Farm.find(params[:farm][:farm_id])
            if params[:id] == "land_details"
                creation_params[:lands_attributes].each do |key, value|
                    @land = Land.new(value.merge(farm_id: @farm.id))
                    @land.save
                end
            elsif params[:id] == "hedgerow_details"
                creation_params[:hedgerows_attributes].each do |key, value|
                    @hedgerow = Hedgerow.new(value.merge(farm_id: @farm.id))
                    @hedgerow.save
                end
            else
                @farm.update(creation_params.except(:farm_id))
            end
            redirect_to wizard_path(next_step, farm_id: @farm.id)
        end
    end

    private

    def creation_params
        params.require(:farm).permit!
    end

    def target_params
        params.require(:target).permit!
    end

end

