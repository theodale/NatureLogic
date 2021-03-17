class InFieldSoilTestsController < ApplicationController

    def show
        @farm = Farm.find(params[:farm_id])
        if @farm.in_field_soil_test
            @in_field_soil_test = @farm.in_field_soil_test
        else
            @in_field_soil_test = @farm.build_in_field_soil_test
            @in_field_soil_test.save()
        end
        @soil_samples = @in_field_soil_test.soil_samples
    end

end
