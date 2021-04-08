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

    def average_compaction
        compactions = []
        self.soil_samples.each do |soil_sample|
            compactions << soil_sample.compaction
        end
        compactions.sum.to_f / compactions.size.to_f
    end

    def average_crusting
        crustings = []
        self.soil_samples.each do |soil_sample|
            crustings << soil_sample.crusting
        end
        crustings.sum.to_f / crustings.size.to_f
    end

    def average_diversity_of_macro_life
        diversity_of_macro_lifes = []
        self.soil_samples.each do |soil_sample|
            diversity_of_macro_lifes << soil_sample.diversity_of_macro_life
        end
        diversity_of_macro_lifes.sum.to_f / diversity_of_macro_lifes.size.to_f
    end

    def average_ground_cover
        ground_covers = []
        self.soil_samples.each do |soil_sample|
            ground_covers << soil_sample.ground_cover
        end
        ground_covers.sum.to_f / ground_covers.size.to_f
    end

    def average_ponding
        pondings = []
        self.soil_samples.each do |soil_sample|
            pondings << soil_sample.ponding
        end
        pondings.sum.to_f / pondings.size.to_f
    end

    def average_plant_health
        plant_healths = []
        self.soil_samples.each do |soil_sample|
            plant_healths << soil_sample.plant_health
        end
        plant_healths.sum.to_f / plant_healths.size.to_f
    end

    def average_root_growth
        root_growths = []
        self.soil_samples.each do |soil_sample|
            root_growths << soil_sample.root_growth
        end
        root_growths.sum.to_f / root_growths.size.to_f
    end

    def average_aggregate_stability
        aggregate_stabilitys = []
        self.soil_samples.each do |soil_sample|
            aggregate_stabilitys << soil_sample.aggregate_stability
        end
        aggregate_stabilitys.sum.to_f / aggregate_stabilitys.size.to_f
    end

    def average_soil_colour
        soil_colours = []
        self.soil_samples.each do |soil_sample|
            soil_colours << soil_sample.soil_colour
        end
        soil_colours.sum.to_f / soil_colours.size.to_f
    end

    def average_soil_smell
        soil_smells = []
        self.soil_samples.each do |soil_sample|
            soil_smells << soil_sample.soil_smell
        end
        soil_smells.sum.to_f / soil_smells.size.to_f
    end

end
