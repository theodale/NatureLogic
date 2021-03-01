class FarmDisplayController < ApplicationController
    def carbon_snapshot
        @farm = Farm.find(params[:farm_id])
    end

    def energy_snapshot
        @farm = Farm.find(params[:farm_id])
    end

    def nature_snapshot
        @farm = Farm.find(params[:farm_id])
    end
end
