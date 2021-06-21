class SustainabilitySurveysController < ApplicationController
  def edit
    @farm = Farm.find(params[:farm_id])
    @sustainability_survey = @farm.sustainability_survey
  end

  def update
    @farm = Farm.find(params[:farm_id])
    @farm.sustainability_survey.update(sustainability_survey_params)
    redirect_to edit_farm_path(@farm)
  end

  private

  def sustainability_survey_params
    params.require(:sustainability_survey).permit(
      :extensive_grazing_only,
      :mowing_grazing_delayed,
      :refuge_areas,
      :river_bank_vegetation_mown,
      :river_bank_vegetation_left_standing_or_mown_in_phases,
      :water_course_buffered_twelve_metres,
      :water_course_cleared_regularly,
      :dredge_cuttings_removed_promptly,
      :pond_ditches_buffered,
      :pond_bank_vegetation_mown_every_one_two_years,
      :pond_bank_vegetation_left_standing,
      :pond_plants_cleared,
      :pond_cuttings_cleared_plants_removed_promptly,
      :cover_crops,
      :intercropping,
      :minimum_tillage,
      :crop_rotations,
      :legumes_or_grass_clover_crop_rotations,
      :mulch_management,
      :green_manure,
      :integrated_pest_management,
      :local_seed_varieties,
      :avoidance_of_chemical_fertilisers_pesticides_herbicides,
      :no_irrigation,
      :overwinter_stubble,
      :winter_cover_crops,
      :flower_rich_margins,
      :four_to_six_metre_buffers_cultivated_land,
      :avoidance_of_chemical_fertilisers,
      :avoidance_of_slurry_and_mineral_fertiliser,
      :control_problem_weeds,
      :soil_and_grass_root_stock_left_intact,
      :livestock_grazed_manure_retained,
      :no_grazing_between_march_june,
      :mowing_between_july_september,
      :mowing_in_phases,
      :cuttings_removed,
      :in_field_grass_strips,
      :dead_wood_retention,
      :buffer_strips,
      :re_stocking,
      :deer_proof_fencing,
      :open_areas,
      :pond_bank_trees_shrubs_pruned_pollarded_coppiced,
      :dredged_once_twice_every_five_years_material_removed
    )
  end
end
