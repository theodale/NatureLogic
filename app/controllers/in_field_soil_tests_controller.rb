class InFieldSoilTestsController < ApplicationController
  def edit
    @farm = Farm.find(params[:farm_id])
    @creation = params[:creation]
    if @farm.in_field_soil_test
      @in_field_soil_test = @farm.in_field_soil_test
    else
      @in_field_soil_test = @farm.build_in_field_soil_test
      @in_field_soil_test.save
    end
  end
end
