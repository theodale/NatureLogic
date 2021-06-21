class TargetsController < ApplicationController
  def edit
    if params[:from_estate]
      @estate = Estate.find(params[:estate_id])
      @target = @estate.target
    elsif params[:from_farm]
      @farm = Farm.find(params[:farm_id])
      @target = @farm.target
    end
  end

  def update
      if params[:from_estate]
        @estate = Estate.find(params[:estate_id])
        @estate.target.update(target_params)
        redirect_to edit_estate_target_path(estate_id: @estate.id, from_estate: true, updated: true)
      elsif params[:from_farm]
        @farm = Farm.find(params[:farm_id])
        @farm.target.update(target_params)
        redirect_to edit_farm_path(@farm)
    end
  end

  private

  def target_params
    params.require(:target).permit(
      :net_carbon_emission,
      :mean_SOC,
      :soil_health_score,
      :ecological_focus_area,
      :sustainable_practices
    )
  end
end


