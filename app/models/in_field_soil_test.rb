class InFieldSoilTest < ApplicationRecord
  belongs_to :farm
  has_many :soil_samples, dependent: :destroy

  def soil_health_score
    if soil_samples.length == 0
      0
    else
      total_score = 0
      soil_samples.each do |soil_sample|
        total_score += (
            soil_sample.compaction +
            soil_sample.diversity_of_macro_life +
            soil_sample.crusting +
            soil_sample.ground_cover +
            soil_sample.ponding +
            soil_sample.plant_health +
            soil_sample.root_growth +
            soil_sample.aggregate_stability
          )
      end
      (total_score * 100) / (16 * soil_samples.length)
    end
  end

  def average_compaction
    compactions = []
    soil_samples.each do |soil_sample|
      compactions << soil_sample.compaction
    end
    compactions.sum.to_f / compactions.size.to_f
  end

  def average_crusting
    crustings = []
    soil_samples.each do |soil_sample|
      crustings << soil_sample.crusting
    end
    crustings.sum.to_f / crustings.size.to_f
  end

  def average_diversity_of_macro_life
    diversity_of_macro_lifes = []
    soil_samples.each do |soil_sample|
      diversity_of_macro_lifes << soil_sample.diversity_of_macro_life
    end
    diversity_of_macro_lifes.sum.to_f / diversity_of_macro_lifes.size.to_f
  end

  def average_ground_cover
    ground_covers = []
    soil_samples.each do |soil_sample|
      ground_covers << soil_sample.ground_cover
    end
    ground_covers.sum.to_f / ground_covers.size.to_f
  end

  def average_ponding
    pondings = []
    soil_samples.each do |soil_sample|
      pondings << soil_sample.ponding
    end
    pondings.sum.to_f / pondings.size.to_f
  end

  def average_plant_health
    plant_healths = []
    soil_samples.each do |soil_sample|
      plant_healths << soil_sample.plant_health
    end
    plant_healths.sum.to_f / plant_healths.size.to_f
  end

  def average_root_growth
    root_growths = []
    soil_samples.each do |soil_sample|
      root_growths << soil_sample.root_growth
    end
    root_growths.sum.to_f / root_growths.size.to_f
  end

  def average_aggregate_stability
    aggregate_stabilitys = []
    soil_samples.each do |soil_sample|
      aggregate_stabilitys << soil_sample.aggregate_stability
    end
    aggregate_stabilitys.sum.to_f / aggregate_stabilitys.size.to_f
  end

  def average_soil_colour
    soil_colours = []
    soil_samples.each do |soil_sample|
      soil_colours << soil_sample.soil_colour
    end
    soil_colours.sum.to_f / soil_colours.size.to_f
  end

  def average_soil_smell
    soil_smells = []
    soil_samples.each do |soil_sample|
      soil_smells << soil_sample.soil_smell
    end
    soil_smells.sum.to_f / soil_smells.size.to_f
  end
end
