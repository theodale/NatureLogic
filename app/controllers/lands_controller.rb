class LandsController < ApplicationController
  def index
    @creation = params[:creation]
    @farm = Farm.find(params[:farm_id])
  end

  def new
    @creation = params[:creation]
    @farm = Farm.find(params[:farm_id])
    @land = @farm.lands.build
  end

  def edit
    @creation = params[:creation]
    @farm = Farm.find(params[:farm_id])
    @land = Land.find(params[:id])
  end

  def create
    @farm = Farm.find(params[:farm_id])
    @land = @farm.lands.create(land_params)
    redirect_to farm_lands_path(@farm, creation: params[:creation])
  end

  def update
    @farm = Farm.find(params[:farm_id])
    Land.find(params[:id]).update(land_params)
    redirect_to farm_lands_path(@farm, creation: params[:creation])
  end

  def destroy
    @farm = Farm.find(params[:farm_id])
    Land.find(params[:id]).destroy
    redirect_to farm_lands_path(@farm, creation: params[:creation])
  end

  private

  def land_params
    params.require(:land).permit(
      :name,
      :code,
      :land_type_id,
      :area,
      :sprayed,
      :tillage_method,
      :rotation_practice,
      :habitat_condition,
      :ecological_connectivity,
      :strategic_significance
    )
  end
end
