class Estate < ApplicationRecord
    has_many :farm_timelines
    belongs_to :estate_user

    def get_total quantity
        total = 0
        self.farm_timelines.each do |farm_timeline|
            @farm = Farm.find(farm_timeline.initial_farm_id)
            total += @farm.send(quantity)
        end
        return total
    end

    def average_biodiversity_score
        scores = []
        self.farm_timelines.each do |farm_timeline|
            @farm = Farm.find(farm_timeline.initial_farm_id)
            scores << @farm.biodiversity_survey.biodiversity_percentage_score
        end
        if scores.size == 0
            return 0
        else
            return (scores.sum(0.0) / scores.size).round(1)
        end
    end

    def average_soil_health_score
        scores = []
        self.farm_timelines.each do |farm_timeline|
            @farm = Farm.find(farm_timeline.initial_farm_id)
            scores << @farm.in_field_soil_test.soil_health_score
        end
        if scores.size == 0
            return 0
        else
            return (scores.sum(0.0) / scores.size).round(1)
        end
    end

    def average_SOC
        values = []
        self.farm_timelines.each do |farm_timeline|
            @farm = Farm.find(farm_timeline.initial_farm_id)
            values << @farm.lab_based_soil_test.mean_SOC
        end
        if values.size == 0
            return 0
        else
            return values.sum(0.0) / values.size
        end
    end

end
