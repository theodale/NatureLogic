class HedgerowsController < ApplicationController

    def index
        @creation = params[:creation]
        @farm = Farm.find(params[:farm_id])
    end

    def new
        @creation = params[:creation]
        @farm = Farm.find(params[:farm_id])
        @hedgerow = @farm.hedgerows.build
    end

    def edit
        @creation = params[:creation]
        @farm = Farm.find(params[:farm_id])
        @hedgerow = Hedgerow.find(params[:id])
    end

    def create
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        @farm.hedgerows.create(hedgerow_params)
        redirect_to farm_hedgerows_path(@farm, creation: @creation)
    end

    def update
        @farm = Farm.find(params[:farm_id])
        Hedgerow.find(params[:id]).update(hedgerow_params)
        redirect_to farm_hedgerows_path(@farm, creation: params[:creation])
    end

    def destroy
        @farm = Farm.find(params[:farm_id])
        Hedgerow.find(params[:id]).destroy
        redirect_to farm_hedgerows_path(@farm, creation: params[:creation])
    end

    private

    def hedgerow_params
        params.require(:hedgerow).permit(
            :hedgerow_type_id,
            :length,
            :description
        )
    end

end

