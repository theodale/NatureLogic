class CreateCountrysideStewardshipSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :countryside_stewardship_surveys do |t|
      t.belongs_to :farm
      t.boolean :nectar_flower_mix, default: false
      t.boolean :flower_rich_margins_and_plots, default: false
      t.boolean :skylark_plots, default: false
      t.boolean :nesting_plots_for_lapwing_and_stone_curlew, default: false
      t.boolean :enhanced_overwinter_stubble, default: false
      t.boolean :supplementary_winter_feeding_for_farmland_birds, default: false
      t.boolean :autumn_sown_bumblebird_mix, default: false
      t.boolean :brassica_fodder_crop, default: false
      t.boolean :winter_cover_crops, default: false
      t.boolean :arable_reversion_to_grassland_with_low_fertilizer_input, default: false
      t.boolean :small_buffer_strip_on_cultivated_land, default: false
      t.boolean :large_buffer_strip_on_cultivated_land, default: false
      t.boolean :in_field_grass_strips, default: false
      t.boolean :field_corners_out_of_production, default: false
      t.boolean :lenient_grazing_supplement, default: false
      t.boolean :buffer_strip_on_intensive_grassland, default: false
      t.boolean :management_of_intensive_grassland_adjacent_to_watercourse, default: false
      t.boolean :seasonal_livestock_removal_on_intensive_grassland, default: false
      t.boolean :management_of_hedgerows, default: false
      t.boolean :hedgerow_gapping_up, default: false
      t.boolean :planting_new_hedges, default: false
      t.boolean :pond_management, default: false
      t.boolean :buffering_in_field_ponds_and_ditches_on_arable_land, default: false
      t.boolean :tree_planting, default: false
      t.timestamps
    end
  end
end


