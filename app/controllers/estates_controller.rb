class EstatesController < ApplicationController

  def show
    @estate = current_estate_user.estate
  end

  def new
    @estate = current_estate_user.build_estate
  end

  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      redirect_to estate_path(@estate)
    else
      render :new
    end
  end

  def update
    @estate = Estate.find(params[:id])
    @estate.update(estate_params)
    redirect_to estate_path(@estate)
  end

  def add_farm
    @estate = Estate.find(params[:estate_id])
    @farm = @estate.farms.build
  end

  def create_farm
    farm = Farm.create(farm_params)
    redirect_to estate_path(current_estate_user.estate)
  end

  def add_farm_user
    @estate = Estate.find(params[:estate_id])
    @current_estate_user = current_estate_user
    @farm = Farm.find(params[:farm_id])
  end

  def create_farm_user
    farm_user = FarmUser.new(farm_params)
    farm_user.save(validate: false)
    farm = Farm.find(params[:farm_id])
    farm.farm_user_id = farm_user.id
    farm.save
    redirect_to estate_path(current_estate_user.estate)
  end

  def overview
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

end