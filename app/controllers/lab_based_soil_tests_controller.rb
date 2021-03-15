class LabBasedSoilTestsController < ApplicationController

    def show
        @farm = Farm.find(params[:farm_id])
        if @farm.lab_based_soil_test
            @lab_based_soil_test = @farm.lab_based_soil_test
        else
            @lab_based_soil_test = @farm.build_lab_based_soil_test
            @lab_based_soil_test.save()
        end
        @soil_parcels = @lab_based_soil_test.soil_parcels
    end

end
