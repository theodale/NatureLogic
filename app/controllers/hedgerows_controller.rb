class HedgerowsController < ApplicationController

    def index
        @creation = params[:creation]
        @farm = Farm.find(params[:farm_id])
        @hedgerows = @farm.hedgerows
    end

    def new
        @creation = params[:creation]
        @farm = Farm.find(params[:farm_id])
        @hedgerow = @farm.hedgerows.build
    end

    def create
        @farm = Farm.find(params[:farm_id])
        @creation = params[:creation]
        @hedgerow = @farm.hedgerows.new(hedgerow_params)
        if @hedgerow.save
            redirect_to farm_hedgerows_path(@farm, creation: @creation)
        else
            render :new
        end
    end

    def destroy
        @farm = Farm.find(params[:farm_id])
        @hedgerow = hedgerow.find(params[:id])
        @hedgerow.destroy
        redirect_to farm_hedgerows_path(@farm, creation: params[:creation])
    end

    private

    def hedgerow_params
        params.require(:hedgerow).permit(
            :hedgerow_type_id,
            :length
        )
    end

end

