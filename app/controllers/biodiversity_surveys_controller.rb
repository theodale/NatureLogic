class BiodiversitySurveysController < ApplicationController
  def edit
    @farm = Farm.find(params[:farm_id])
    @biodiversity_survey = @farm.biodiversity_survey
  end

  def update
    @farm = Farm.find(params[:farm_id])
    @farm.biodiversity_survey.update(biodiversity_survey_params)
    redirect_to edit_farm_path(@farm)
  end

  private

  def biodiversity_survey_params
    params.require(:biodiversity_survey).permit(
      :area_designated_for_natural_conservation,
      :area_in_existing_agri_environment_schemes,
      :area_of_grass_wildflower_scrub_not_for_production,
      :wider_countryside_description,
      :number_of_crop_types,
      :number_of_heritage_crops,
      :number_of_livestock_breeds,
      :number_of_rare_breeds,
      :grassland_condition,
      :threatened_species,
      :threatened_species_description,
      :number_of_vascular_plant_species,
      :number_of_wild_bee_species,
      :number_of_farmland_bird_species,
      :number_of_butterfly_species,
      :number_of_mammal_species
    )
  end
end
