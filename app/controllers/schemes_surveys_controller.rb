class SchemesSurveysController < ApplicationController
  def edit
    @farm = Farm.find(params[:farm_id])
    @creation = params[:creation]
    @schemes_survey = @farm.schemes_survey || @farm.build_schemes_survey
  end

  def update
    @farm = Farm.find(params[:farm_id])
    if @farm.schemes_survey
      @farm.schemes_survey.update(schemes_survey_params)
    else
      @farm.create_schemes_survey(schemes_survey_params)
    end
    if params[:creation]
      redirect_to farm_creation_path(:countryside_stewardship_surveys, farm_id: @farm.id)
    else
      redirect_to edit_farm_path(@farm)
    end
  end

  private

  def schemes_survey_params
    params.require(:schemes_survey).permit(
      :sustainable_farming_incentive,
      :local_nature_recovery,
      :landscape_recovery,
      :environmental_land_management,
      :countryside_stewardship,
      :environmental_stewardship,
      :woodland_grant,
      :organic_association,
      :soil_association,
      :pasture_fed_livestock_association,
      :sustainable_wool_standard,
      :regenerative_organic_certification,
      :conservation_projects,
      :conservation_projects_number,
      :landscape_networks,
      :landscape_networks_number
    )
  end
end
