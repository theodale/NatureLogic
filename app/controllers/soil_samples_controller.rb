class SoilSamplesController < ApplicationController

    def new
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        @in_field_soil_test = @farm.in_field_soil_test
        @soil_sample = @in_field_soil_test.soil_samples.build
    end

    def create
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        if params[:soil_sample][:name] == ""
            params[:soil_sample][:name] = "Sample " + (@farm.in_field_soil_test.soil_samples.size + 1).to_s
        end
        @soil_sample = @farm.in_field_soil_test.soil_samples.build(soil_sample_params)
        if @soil_sample.save
            redirect_to edit_farm_in_field_soil_test_path(@farm, creation: @creation)
        else
            redirect_to new_farm_in_field_soil_test_soil_sample_path(@farm, creation: @creation)
        end
    end

    def destroy
        @farm = Farm.find(params[:farm_id])
        SoilSample.find(params[:id]).destroy
        redirect_to edit_farm_in_field_soil_test_path(@farm, creation: params[:creation])
    end

    private

    def soil_sample_params
        params.require(:soil_sample).permit(
            :name,
            :compaction,
            :diversity_of_macro_life,
            :crusting,
            :ground_cover,
            :ponding,
            :plant_health,
            :root_growth,
            :aggregate_stability,
            :soil_colour,
            :soil_smell
        )
    end
end