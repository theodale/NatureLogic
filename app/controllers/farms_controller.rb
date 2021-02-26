class FarmsController < ApplicationController
    def index
        @farms = Farm.all
    end

    def create
        @farm = Farm.new(farm_params)
        if @farm.save
            redirect_to farm_creation_path(:energy_details, farm_id: @farm.id)
        else
          render :new
        end
    end

    def new
        @farm = Farm.new
        @farm.build_target
        @farm.lands.build
        @farm.hedgerows.build
    end

    def show
        @farm = Farm.find(params[:id])
        @farm.lands.each do |land|
            # create if doesn't exist
            request.query_parameters[land.id.to_s] = 0 if !request.query_parameters[land.id.to_s]
            # update request.query_parameters[land.id]
            if request.query_parameters[:from_land_id] == land.id.to_s
                logger.debug "True"
                request.query_parameters[land.id.to_s] = request.query_parameters[land.id.to_s].to_i - 1
            elsif request.query_parameters[:to_land_id] == land.id.to_s
                logger.debug "Else"
                request.query_parameters[land.id.to_s] = request.query_parameters[land.id.to_s].to_i + 1
            end
        end
        @farm.perform_interventions(request.query_parameters)
    end

    def destroy
        @farm = Farm.find(params[:id])
        @farm.destroy
        redirect_to farms_path
    end

    private

    def farm_params
        params.require(:farm).permit!
    end

end

