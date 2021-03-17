class InFieldSoilTest < ApplicationRecord
    belongs_to :farm
    has_many :soil_samples, dependent: :destroy
    accepts_nested_attributes_for :soil_samples

    def soil_health_score
        average_sample_scores = []
        self.soil_samples.each do |soil_sample|
            total_metrics_score =
                soil_sample.compaction +
                soil_sample.diversity_of_macro_life +
                soil_sample.crusting +
                soil_sample.ground_cover +
                soil_sample.ponding +
                soil_sample.plant_health +
                soil_sample.root_growth +
                soil_sample.aggregate_stability +
                soil_sample.soil_colour +
                soil_sample.soil_smell
            average_sample_scores << (total_metrics_score / 10)
        end
        if average_sample_scores.length > 0
            return (average_sample_scores.sum(0) * 5 / average_sample_scores.length)
        else
            return 0
        end
    end
end
