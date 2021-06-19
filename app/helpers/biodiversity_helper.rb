module BiodiversityHelper

    def habitat_condition_table_data habitat
        if habitat.habitat_condition == "Good."
            return "Good"
        elsif habitat.habitat_condition == "Moderate."
            return "Moderate"
        elsif habitat.habitat_condition == "Poor."
            return "Poor"
        else
            return "N/A"
        end
    end

    def ecological_connectivity_table_data habitat
        if habitat.ecological_connectivity == "Highly connected habitat."
            return "High"
        elsif habitat.ecological_connectivity == "Moderately connected habitat."
            return "Moderate"
        elsif habitat.ecological_connectivity == "Unconnected habitat."
            return "Unconnected"
        else
            return "-"
        end
    end

    def strategic_significance_table_data habitat
        if habitat.strategic_significance == "Within local strategy area."
            return "Significant"
        elsif habitat.strategic_significance == "Ecologically desirable area but not within local strategy area."
            return "Desirable"
        else
            return "None"
        end
    end

end

