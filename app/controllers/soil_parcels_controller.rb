class SoilParcelsController < ApplicationController

    def create
        @farm = Farm.find(params[:farm_id])
        @lab_based_soil_test = @farm.lab_based_soil_test
        @soil_parcel = @lab_based_soil_test.soil_parcels.new(soil_parcel_params)
        if @soil_parcel.save
            redirect_to farm_lab_based_soil_test_path(@farm)
        else
            redirect_to farm_lab_based_soil_test_path(@farm)
        end
    end

    def new
        @farm = Farm.find(params[:farm_id])
        @lab_based_soil_test = @farm.lab_based_soil_test
        @soil_parcel = @lab_based_soil_test.soil_parcels.build
    end

    def edit

    end

    def destroy
        @farm = Farm.find(params[:farm_id])
        @soil_parcel = SoilParcel.find(params[:id])
        @soil_parcel.destroy
        redirect_to farm_lab_based_soil_test_path(@farm)
    end

    private

    def soil_parcel_params
        params.require(:soil_parcel).permit!
    end
end

