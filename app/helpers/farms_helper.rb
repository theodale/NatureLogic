module FarmsHelper

    def mean_soc_progress
        if @farm.target.mean_SOC == 0
            return 0
        else
            fractional_progress = @farm.lab_based_soil_test.mean_of(:SOC) / @farm.target.mean_SOC
            return fractional_progress > 1 ? 1 : fractional_progress
        end
    end

    def soil_health_progress
        if @farm.target.soil_health_score == 0
            return 0
        else
            fractional_progress = @farm.in_field_soil_test.soil_health_score / @farm.target.soil_health_score
            return fractional_progress > 1 ? 1 : fractional_progress
        end
    end

    def ecological_focus_areas_progress
        if @farm.target.ecological_focus_area == 0
            return 0
        else
            fractional_progress = @farm.ecological_focus_area_percentage / @farm.target.ecological_focus_area
            return fractional_progress > 1 ? 1 : fractional_progress
        end
    end

    def sustainable_practices_progress
        if @farm.target.sustainable_practices == 0
            return 0
        else
            fractional_progress = @farm.sustainability_survey.sustainable_practice_score / @farm.target.sustainable_practices
            return fractional_progress > 1 ? 1 : fractional_progress
        end
    end

    def net_carbon_result
        if @farm.net_emissions > @farm.target.net_carbon_emission
            return ('
                    <h3 class="carbon-target-result fail">
                        '+ ((@farm.net_emissions - @farm.target.net_carbon_emission).round(0).to_s) +' kg
                        <i class="fas fa-arrow-circle-up ml-1"></i>
                    </h3>
            ').html_safe
        else
            return ('
                    <h3 class="carbon-target-result success">
                    '+ ((@farm.net_emissions - @farm.target.net_carbon_emission).round(0).to_s) +' kg
                        <i class="far fa-check-circle ml-1"></i>
                    </h3>
            ').html_safe
        end
    end

    def emission_chart_data
        data = {
            labels: ["Emissions (kg)", "Sequestration (kg)", "Net (kg)"],
            datasets: [
                {
                    backgroundColor: ['#D92626','#A1D055','#5BCDE8'],
                    data: [@farm.total_emissions, @farm.total_sequestration, @farm.net_emissions],
                }
            ]
        }
        return data
    end

    def emission_chart_options
        options = {
            legend: {
                display: false
            },
            scales: {
                yAxes: [{
                    ticks: {
                        display: false
                    },
                    gridLines: {
                        lineWidth: 0,
                        zeroLineWidth: 1,
                        zeroLineColor: 'grey',
                        drawBorder: false,
                    }
                }],
                xAxes: [{
                    gridLines: {
                        display: false,
                    }
                }]
            }
        }
        return options
    end

    def tree_coverage_chart_data
        data = {
            datasets: [{
                data: [
                    @farm.tree_coverage_percentage,
                    (100 - @farm.tree_coverage_percentage)
                ],
                backgroundColor: ['#A1D055', '#0B5E77']
            }],
            labels: ['Woodland', 'Non-Woodland']
        }
        return data
    end

    def tree_coverage_chart_options
        options = {
            legend: {
                display: false
            },
            cutoutPercentage: 60
        }
        return options
    end

    def ecological_focus_area_chart_data
        data = {
            datasets: [{
                data: [
                    @farm.ecological_focus_area_percentage,
                    (100 - @farm.ecological_focus_area_percentage)
                ],
                backgroundColor: ['#FBB03B', '#0B5E77']
            }],
            labels: ['Focus Area', 'Non-Focus Area']
        }
        return data
    end

    def ecological_focus_area_chart_options
        options = {
            legend: {
                display: false
            },
            cutoutPercentage: 60
        }
        return options
    end

    def habitat_chart_data
        habitat_meta_category_areas = {}
        @farm.lands.each do |land|
            if habitat_meta_category_areas[land.land_type.meta_category]
                habitat_meta_category_areas[land.land_type.meta_category] += land.area
            else
                habitat_meta_category_areas[land.land_type.meta_category] = land.area
            end
        end
        data = {
            datasets: [{
                data: habitat_meta_category_areas.values,
                backgroundColor: ['#FBB03B', '#0B5E77']
            }],
            labels: habitat_meta_category_areas.keys
        }
        return data
    end


    def habitat_chart_options
        options = {}
    end

    def energy_chart_data
        data = {
            datasets: [{
                data: [
                    @farm.total_electricity_use * 0.23314,
                    @farm.total_diesel_use * 2.6870514,
                    @farm.total_gas_use * 0.18387
                ],
                backgroundColor: ['#FFDA0D', '#0B5E77', "#AED7DD"]
            }],
            labels: ["Electricity", "Diesel", "Gas"]
        }
        return data
    end

    def energy_chart_options
        options = {}
    end










    def target_achieved(target, result)
        if result < target
            return ('<i class="fas fa-check-circle fa-lg success"></i>').html_safe
        else
            return ('<i class="fas fa-times-circle target-card-icon fa-lg fail">').html_safe
        end
    end

    def species_change_name(result, target)
        if result > target
            return ('<div class="py-1 px-2 species-value-div success">' + (result.to_s) + '</div>').html_safe
        else
            return ('<div class="py-1 px-2 species-value-div fail">' + (result.to_s) + '</div>').html_safe
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
