class SoilSamplesController < ApplicationController

    def create
        @farm = Farm.find(params[:farm_id])
        @in_field_soil_test = @farm.in_field_soil_test
        @soil_sample = @in_field_soil_test.soil_samples.new(soil_sample_params)
        if @soil_sample.save
            redirect_to farm_in_field_soil_test_path(@farm)
        else
            redirect_to farm_in_field_soil_test_path(@farm)
        end
    end

    def new
        @farm = Farm.find(params[:farm_id])
        @in_field_soil_test = @farm.in_field_soil_test
        @soil_sample = @in_field_soil_test.soil_samples.build
    end

    def destroy
        @farm = Farm.find(params[:farm_id])
        @soil_sample = SoilSample.find(params[:id])
        @soil_sample.destroy
        redirect_to farm_in_field_soil_test_path(@farm)
    end

    private

    def soil_sample_params
        params.require(:soil_sample).permit!
    end
end
