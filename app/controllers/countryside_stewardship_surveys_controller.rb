class CountrysideStewardshipSurveysController < ApplicationController
  def edit
    @farm = Farm.find(params[:farm_id])
    @creation = params[:creation]
    @countryside_stewardship_survey = @farm.countryside_stewardship_survey || @farm.build_countryside_stewardship_survey
  end

  def update
    @farm = Farm.find(params[:farm_id])
    if @farm.countryside_stewardship_survey
      @farm.countryside_stewardship_survey.update(countryside_stewardship_survey_params)
    else
      @farm.create_countryside_stewardship_survey(countryside_stewardship_survey_params)
    end
    if params[:creation]
      redirect_to farm_creation_path(:in_field_soil_tests, farm_id: @farm.id)
    else
      redirect_to edit_farm_path(@farm)
    end
  end

  private

  def countryside_stewardship_survey_params
    params.require(:countryside_stewardship_survey).permit(
      :nectar_flower_mix,
      :flower_rich_margins_and_plots,
      :skylark_plots,
      :nesting_plots_for_lapwing_and_stone_curlew,
      :enhanced_overwinter_stubble,
      :supplementary_winter_feeding_for_farmland_birds,
      :autumn_sown_bumblebird_mix,
      :brassica_fodder_crop,
      :winter_cover_crops,
      :arable_reversion_to_grassland_with_low_fertilizer_input,
      :small_buffer_strip_on_cultivated_land,
      :large_buffer_strip_on_cultivated_land,
      :in_field_grass_strips,
      :field_corners_out_of_production,
      :lenient_grazing_supplement,
      :buffer_strip_on_intensive_grassland,
      :management_of_intensive_grassland_adjacent_to_watercourse,
      :seasonal_livestock_removal_on_intensive_grassland,
      :management_of_hedgerows,
      :hedgerow_gapping_up,
      :planting_new_hedges,
      :pond_management,
      :buffering_in_field_ponds_and_ditches_on_arable_land,
      :tree_planting
    )
  end
end
