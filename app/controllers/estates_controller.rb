class EstatesController < ApplicationController
  def settings_estate
    @estate = current_estate_user.estate
  end

  def settings_farms
    @estate = current_estate_user.estate
  end

  def settings_members
    @estate = current_estate_user.estate
  end

  def show
    @estate = current_estate_user.estate
  end

  def new
    @estate = Estate.new
    @estate.build_target
  end

  def create
    logger.debug estate_params.merge({
      estate_user_id: current_estate_user.id
    })
    @estate = Estate.new(estate_params.merge({
      estate_user_id: current_estate_user.id
    }))
    @estate.save
    logger.debug "ESTATE ID"
    logger.debug @estate.id
    redirect_to estate_overview_path(estate_id: @estate.id)
  end

  def update
    @estate = Estate.find(params[:id])
    @estate.update(estate_params)
    redirect_to estate_settings_estate_path(@estate, updated: true)
  end

  def add_farm_user
    @estate = Estate.find(params[:estate_id])
    @farm_timeline = FarmTimeline.find(params[:farm_timeline_id])
    @farm_user = FarmUser.new
  end

  def create_farm_user
    @farm_user = FarmUser.create(farm_user_params)
    FarmTimeline.find(params[:farm_timeline_id]).update(farm_user_id: @farm_user.id)
    redirect_to estate_settings_members_path(@current_estate_user.estate)
  end

  def overview
    @estate = current_estate_user.estate
  end

  def performance
    @estate = current_estate_user.estate
  end

  private

  def estate_params
    params.require(:estate).permit(
      :name,
      :location,
      :carbon_price,
      target_attributes: [
        :ecological_focus_area,
        :sustainable_practices,
        :soil_health_score,
        :mean_SOC,
        :net_carbon_emission
      ]
    )
  end

  def farm_params
    params.require(:farm).permit(
      :name,
      :location,
      :latitude,
      :longitude
    )
  end

  def farm_user_params
    params.require(:farm_user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
