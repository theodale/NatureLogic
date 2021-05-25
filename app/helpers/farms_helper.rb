module FarmsHelper

    def target_achieved(target, result)
        if result > target
            return ('<i class="fas fa-check-circle fa-lg success"></i>').html_safe
        else
            return ('<i class="fas fa-times-circle target-card-icon fa-lg fail">').html_safe
        end
    end

    def scope_three_hash
        return {
            "Agriculture Products": (@farm.agriculture_products_spend*2.144).round(1),
            "Wood and Wood Products": (@farm.wood_and_wood_products_spend*0.64).round(1),
            "Pesticides": (@farm.pesticides_spend*0.776).round(1),
            "Machinery and Equipment": (@farm.machinery_and_equipment_spend*0.56).round(1),
            "Enteric Emissions": (@farm.number_of_sheep*1003.75 + @farm.number_of_cows*4015).round(1)
        }
    end

    def offset_revenue
        return (60 * @farm.net_emissions / 1000).round(2)
    end

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
        return habitats
    end

    def tree_cover_percentage
        if @farm.total_area != 0
            return (100 * @farm.tree_covered_area / @farm.total_area).round(1)
        else
            return 0
        end
    end

    def nature_positive_areas_percentage
        if @farm.total_area != 0
            return  (100 * @farm.nature_positive_area / @farm.total_area).round(1)
        else
            return 0
        end
    end

    def non_woodland_farmlands
        farmlands = []
        @farm.lands.each do |land|
            logger.debug "TEST"
            if land.land_type.meta_category == "Grassland"
                farmlands << land
            end
            if land.land_type.meta_category == "Cropland"
                farmlands << land
            end
        end
        return farmlands
    end

    def farm_croplands
        croplands = []
        @farm.lands.each do |land|
            if land.land_type.meta_category == "Cropland"
                croplands << land
            end
        end
        return croplands
    end

    def woodlands
        return LandType.all.select {|land_type| land_type.meta_category == "Woodland"}
    end
end
