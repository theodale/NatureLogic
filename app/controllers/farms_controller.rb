class FarmsController < ApplicationController
    def index
        @farms = Farm.where(intervention: false)
    end

    def create
        @farm = Farm.new(farm_params)
        if @farm.save
            redirect_to @farm
        else
          render :new
        end
    end

    def new
        @farm = Farm.new
        @farm.build_target
        @farm.lands.build
        @land_types = LandType.all
    end

    def show
        if !params[:to_woodland] && !params[:reduce_usage] && !params[:go_organic] && !params[:fertiliser_to_manure]
            @intervention_farm = Farm.find(params[:id]).deep_clone include: [:lands, :target]
            @intervention_farm.intervention = true
            @intervention_farm.save
        else
            @intervention_farm = Farm.find(params[:id])
        end
        if params[:to_woodland]
            @intervention_farm.to_woodland(params[:to_woodland])
        elsif params[:reduce_usage]
            @intervention_farm.reduce_usage(params[:reduce_usage])
        elsif params[:go_organic]
            @intervention_farm.go_organic(params[:go_organic])
        elsif params[:fertiliser_to_manure]
            @intervention_farm.fertiliser_to_manure(params[:fertiliser_to_manure])
        end
        @intervention_farm
    end

    private

    def farm_params
        params.require(:farm).permit!
    end

end

