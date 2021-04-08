class SoilParcelsController < ApplicationController

    def new
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        @lab_based_soil_test = @farm.lab_based_soil_test
        @soil_parcel = @lab_based_soil_test.soil_parcels.build
    end

    def create
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        if params[:soil_parcel][:name] == ""
            params[:soil_parcel][:name] = "Parcel " + (@farm.lab_based_soil_test.soil_parcels.size + 1).to_s
        end
        @soil_parcel = @farm.lab_based_soil_test.soil_parcels.build(soil_parcel_params)
        if @soil_parcel.save
            redirect_to edit_farm_lab_based_soil_test_path(@farm, creation: @creation)
        else
            redirect_to new_farm_lab_based_soil_test_soil_parcel_path(@farm, creation: @creation)
        end
    end

    def destroy
        @farm = Farm.find(params[:farm_id])
        SoilParcel.find(params[:id]).destroy
        redirect_to edit_farm_lab_based_soil_test_path(@farm, creation: params[:creation])
    end

    private

    def soil_parcel_params
        params.require(:soil_parcel).permit(
            :name,
            :pH,
            :SOC,
            :bulk_density,
            :soil_texture,
            :total_soil_nitrogen,
            :extractable_phosphorus,
            :extractable_potassium,
            :cation_exchange_capacity,
            :extractable_micronutrients,
            :active_carbon_PoXC,
            :water_holding_capacity
        )
    end

end



