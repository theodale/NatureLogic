class EstatesController < ApplicationController

  def show
    @estate = current_estate_user.estate
  end

  def new
    @estate = current_estate_user.build_estate
  end

  def create
    @estate = Estate.create(estate_params)
    redirect_to estate_path(@estate)
  end

  def update
    @estate = Estate.find(params[:id])
    @estate.update(estate_params)
    redirect_to estate_path(@estate)
  end

  def add_farm
    @estate = Estate.find(params[:estate_id])
    @farm = Farm.new
  end

  def add_farm_user
    @estate = Estate.find(params[:estate_id])
    @farm_timeline = FarmTimeline.find(params[:farm_timeline_id])
    @farm_user = FarmUser.new
  end

  def create_farm_user
    @farm_user = FarmUser.create(farm_user_params)
    FarmTimeline.find(params[:farm_timeline_id]).update(farm_user_id: @farm_user.id)
    redirect_to estate_path(current_estate_user.estate)
  end

  def overview
    @estate = current_estate_user.estate
  end

  def performance
    @estate = current_estate_user.estate
  end

  private

  def estate_params
    params.require(:estate).permit!
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