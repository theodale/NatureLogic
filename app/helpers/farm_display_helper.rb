module FarmDisplayHelper

    def soil_health_traffic_light score
        if score < 0.6667
            return ('<div class="red-traffic-light">Poor</div>').html_safe
        elsif score < 1.3334
            return ('<div class="yellow-traffic-light">Fair</div>').html_safe
        else
          return ('<div class="green-traffic-light">Good</div>').html_safe
        end
    end

    def habitat_area_data
        habitats = {}
        @farm.lands.each do |land|
            if habitats[land.land_type.meta_category]
                habitats[land.land_type.meta_category] += land.area
            else
                habitats[land.land_type.meta_category] = land.area
            end
        end
        habitats
    end

    def tree_cover_percentage
        (100 * @farm.tree_covered_area / @farm.total_area).round(1)
    end

    def nature_positive_areas_percentage
        (100 * @farm.nature_positive_area / @farm.total_area).round(1)
    end

end
