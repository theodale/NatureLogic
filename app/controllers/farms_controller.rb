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
    end
end
