class FarmTimelinesController < ApplicationController

    def new
        @farm_timeline = current_estate_user.estate.farm_timelines.build
    end

    def create
        @farm_timeline = FarmTimeline.create(farm_timeline_params)
        @farm = @farm_timeline.farms.create({year: Time.now.year})
        @farm.target = current_estate_user.estate.target.dup
        @farm.save
        @farm.create_associations
        redirect_to estate_settings_farms_path(current_estate_user.estate)
    end

    def destroy
        @farm_timeline = FarmTimeline.find(params[:id])
        @farm_timeline.destroy_farms
        @farm_timeline.destroy
        redirect_to estate_settings_farms_path(current_estate_user.estate)
    end

    private

    def farm_timeline_params
        params.require(:farm_timeline).permit(
            :name,
            :location,
            :farm_type,
            :postcode,
            :region,
            :estate_id
        )
    end
end
