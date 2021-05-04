class FarmDisplayController < ApplicationController
    def carbon_performance
        @farm = Farm.find(params[:farm_id])
    end

    def energy_performance
        @farm = Farm.find(params[:farm_id])
    end

    def nature_performance
        @farm = Farm.find(params[:farm_id])
    end

    def soil_performance
        @farm = Farm.find(params[:farm_id])
    end

    def sustainability_performance
        @farm = Farm.find(params[:farm_id])
    end

    def snapshot
        @farm = Farm.find(params[:farm_id])
    end

    def profile
        @farm = Farm.find(params[:farm_id])
    end
end
