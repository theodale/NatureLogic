class FarmsController < ApplicationController
    before_action :get_farm_from_farm_id, only: [
        :snapshot, :carbon, :energy, :nature, :soil,
        :sustainability, :strategy, :profile,
        :edit_details, :edit_energy, :edit_resources,
        :edit_livestock, :create_in_timeline
    ]

    def create
        if current_farm_user
            @farm_timeline = FarmTimeline.create(
                farm_user_id: current_farm_user.id)
            @farm = Farm.create({
                farm_timeline_id: @farm_timeline.id,
                year: Date.current.year.to_i})
        else
            @farm_timeline = FarmTimeline.create(
                estate_id: current_estate_user.estate.id)
            @farm = Farm.create(farm_params.merge({
                farm_timeline_id: @farm_timeline.id,
                year: Date.current.year.to_i}))
        end
        @farm.create_associations
        @farm_timeline.update({initial_farm_id: @farm.id})
        if params[:estate]
            redirect_to estate_path(current_estate_user.estate)
        else
            redirect_to farm_creation_path(:start, farm_id: @farm.id)
        end
    end

    def create_in_timeline
        @new_farm = @farm.farm_timeline.add(params[:year], @farm.id)
        redirect_to farm_path(@new_farm)
    end

    def show
        @farm = Farm.find(params[:id])
        redirect_to farm_snapshot_path(@farm)
    end

    def edit
        @farm = Farm.find(params[:id])
    end

    def update
        @farm = Farm.find(params[:id])
        @farm.update(farm_params)
        if params[:from_profile]
            redirect_to farm_profile_path
        else
            redirect_to edit_farm_path
        end
    end

    def destroy
        @farm.destroy
        redirect_to farms_path
    end

    # Display

    def snapshot
        if params[:skip_creation]
            @farm.created = true
            @farm.save
        end
        if !@farm.created
            redirect_to farm_creation_path(:start, farm_id: @farm.id)
        end
    end

    def carbon
    end

    def energy
    end

    def nature
    end

    def soil
    end

    def sustainability
    end

    def strategy
        @current_farm_values = {
            carbon_balance: @farm.net_emissions,
            biodiversity_score: @farm.biodiversity_survey.biodiversity_percentage_score,
            space_for_nature_score: @farm.space_for_nature_score,
            defra_habitat_score: @farm.defra_habitat_score
        }
        interventions = params.permit!.to_h.slice(
            :woodland_conversion,
            :applied_interventions,
            :hedgerow_conversion,
            :diesel_reduction,
            :fertiliser_reduction,
            :green_energy_tariff,
            :increase_soc
        )
        @applied_interventions = @farm.perform_interventions(interventions)
    end

    def profile
        @potential_years = @farm.farm_timeline.free_years
    end

    # Edit

    def edit_details
    end

    def edit_energy
    end

    def edit_resources
    end

    def edit_livestock
    end

    private

    def get_farm_from_farm_id
        @farm = Farm.find(params[:farm_id])
    end

    def farm_params
        params.require(:farm).permit(
            :name,
            :location,
            :latitude,
            :longitude,
            :total_diesel_use,
            :total_gas_use,
            :total_electricity_use,
            :artificial_fertiliser_use,
            :agriculture_products_spend,
            :wood_and_wood_products_spend,
            :pesticides_spend,
            :machinery_and_equipment_spend,
            :other_spend,
            :number_of_sheep,
            :number_of_cows
        )
    end

end


