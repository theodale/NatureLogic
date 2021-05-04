class LandsController < ApplicationController

    def index
        @creation = params[:creation]
        @farm = Farm.find(params[:farm_id])
    end

    def new
        @creation = params[:creation]
        @farm = Farm.find(params[:farm_id])
        @land = @farm.lands.build
    end

    def create
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        @land = @farm.lands.new(land_params)
        if @land.save
            redirect_to farm_lands_path(@farm, creation: @creation)
        else
            render :new
        end
    end

    def destroy
        @farm = Farm.find(params[:farm_id])
        Land.find(params[:id]).destroy
        redirect_to farm_lands_path(@farm, creation: params[:creation])
    end

    private

    def land_params
        params.require(:land).permit(
            :land_type_id,
            :area,
            :sprayed,
            :tillage_score,
            :rotation_score
        )
    end

end
