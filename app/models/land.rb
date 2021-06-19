class Land < ApplicationRecord
    belongs_to :farm
    belongs_to :land_type

    def change_area a
        self.area = a
    end

    def biodiversity_units
        if self.habitat_condition == "Good."
            habitat_condition_multiplier = 3
        elsif self.habitat_condition == "Moderate."
            habitat_condition_multiplier = 2
        else
            habitat_condition_multiplier = 1
        end
        if self.ecological_connectivity == "Highly connected habitat."
            ecological_connectivity_multiplier = 1.15
        elsif self.ecological_connectivity == "Moderately connected habitat."
            ecological_connectivity_multiplier = 1.1
        else
            ecological_connectivity_multiplier = 1
        end
        if self.strategic_significance == "Within local strategy area."
            strategic_significance_multiplier = 1.15
        elsif self.strategic_significance == "Ecologically desirable area but not within local strategy area."
            strategic_significance_multiplier = 1.1
        else
            strategic_significance_multiplier = 1
        end
        units = self.area * self.land_type.defra_uniqueness_score * habitat_condition_multiplier *
            ecological_connectivity_multiplier * strategic_significance_multiplier
        return units
    end

    def sequestration
        if self.tillage_method == "Conventional tillage."
            tillage_score = 0.01
        elsif self.tillage_method == "Reduced tillage."
            tillage_score = 0.03
        else
            tillage_score = 1
        end
        return (self.area * self.land_type.sequestration_per_ha * tillage_score)
    end

    def type
        return self.land_type.category
    end

end

