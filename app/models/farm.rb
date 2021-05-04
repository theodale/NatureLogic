class Farm < ApplicationRecord
    belongs_to :estate, optional: true
    belongs_to :farm_user, optional: true
    has_many :lands, dependent: :destroy
    has_many :hedgerows, dependent: :destroy
    has_one :target, dependent: :destroy
    has_one :biodiversity_survey, dependent: :destroy
    has_one :sustainability_survey, dependent: :destroy
    has_one :schemes_survey, dependent: :destroy
    has_one :countryside_stewardship_survey, dependent: :destroy
    has_one :lab_based_soil_test, dependent: :destroy
    has_one :in_field_soil_test, dependent: :destroy
    accepts_nested_attributes_for :target
    accepts_nested_attributes_for :lands, allow_destroy: true
    accepts_nested_attributes_for :hedgerows, allow_destroy: true


    # Carbon

    def scope_one
        emissions = self.total_diesel_use*0.25278 + self.total_gas_use*0.18387
        emissions.round(0)
    end

    def scope_two
        emissions = self.total_electricity_use*0.23314
        emissions.round(0)
    end

    def scope_three
        emissions = self.artificial_fertiliser_use*3.6 +
        self.agriculture_products_spend*2.144 +
        self.wood_and_wood_products_spend*0.64 +
        self.pesticides_spend*0.776 +
        self.machinery_and_equipment_spend*0.56 +
        self.number_of_sheep*1003.75 +
        self.number_of_cows*4015
        emissions.round(0)
    end

    def total_emissions
        scope_one + scope_two + scope_three
    end

    # Land and hedgerow sequestration
    def annual_sequestration
        total = 0
        self.lands.each do |land|
            total -= land.sequestration
        end
        self.hedgerows.each do |hedgerow|
            total -= hedgerow.sequestration
        end
        total.round(0)
    end

    # Lab-based soil test sequestration
    def farmland_sequestration
        total = self.lab_based_soil_test.total_carbon_in_terms_of_CO2e_last_year -
            self.lab_based_soil_test.total_carbon_in_terms_of_CO2e
        total.round(0)
    end

    def total_sequestration
        annual_sequestration + farmland_sequestration
    end

    def net_emissions
        net = total_emissions + annual_sequestration + farmland_sequestration
        net.round(0)
    end

    def potential_revenue_from_offset
        (net_emissions * 0.06).round(2)
    end

    def above_ground_carbon
        total = 0
        self.lands.each do |land|
            total += land.area * land.land_type.above_ground_carbon_per_ha
        end
        self.hedgerows.each do |hedgerow|
            total += hedgerow.length * hedgerow.hedgerow_type.above_ground_carbon_per_km
        end
        total.round(0)
    end

    def sequestration_by_meta_category
        sequestrations = {}
        self.lands.each do |land|
            if sequestrations[land.land_type.meta_category]
                logger.debug "1"
                sequestrations[land.land_type.meta_category] += land.sequestration
            else
                logger.debug "2"
                sequestrations[land.land_type.meta_category] = land.sequestration
            end
        end
        self.hedgerows.each do |hedgerow|
            sequestrations[hedgerow.hedgerow_type.category] = hedgerow.sequestration
        end
        sequestrations
    end


    # Nature

    def defra_habitat_score
        total = 0
        self.lands.each do |land|
            total += (land.land_type.defra_uniqueness_score * land.area / 10)
        end
        self.hedgerows.each do |hedgerow|
            total += hedgerow.hedgerow_type.defra_uniqueness_score * hedgerow.length
        end
        (total / total_area).round(1)
    end

    def space_for_nature_score
        total_area = 0
        total_space_for_nature_index = 0
        self.lands.each do |land|
            total_area += land.area
            spray_factor = land.sprayed ? 0.2 : 1
            total_space_for_nature_index += spray_factor * land.area * land.land_type.area_for_nature_rating
        end
        (total_space_for_nature_index / (total_area * 10)).round(1)
    end

    def tree_covered_area
        area = 0
        self.lands.each do |land|
            if land.land_type.meta_category == "Woodland and forest"
                area += land.area
            end
        end
        area
    end

    def scrubland_area
        area = 0
        self.lands.each do |land|
            if land.land_type.meta_category == "Heathland & Scrub"
                area += land.area
            end
        end
        area
    end

    def nature_positive_area
        area = self.biodiversity_survey.area_of_grass_wildflower_scrub_not_for_production +
            self.biodiversity_survey.area_designated_for_natural_conservation +
            tree_covered_area +
            scrubland_area
        area
    end

    # Interventions

    # def perform_interventions(interventions)
    #     interventions.each do |intervention, value|
    #         perform_intervention(intervention, value)
    #     end
    # end

    # def perform_intervention(intervention, value)
    #     land_ids = []
    #     self.lands.each do |land|
    #         land_ids << land.id.to_s
    #     end
    #     if intervention == "cropland_to_woodland"
    #         self.number_of_sheep += value.to_i
    #     elsif intervention == "green_electricity_tariff"
    #         self.total_electricity_use = 0 if value == "true"
    #     elsif intervention == "reduce_diesel_use"
    #         self.total_diesel_use = self.total_diesel_use * value.to_f
    #     elsif intervention == "reduce_fertiliser_use"
    #         self.artificial_fertiliser_use = self.artificial_fertiliser_use * value.to_f
    #     elsif intervention == "go_organic"
    #         self.artificial_fertiliser_use = 0 if value == "true"
    #         self.lands.each do |land|
    #             land.sprayed = false if value == "true"
    #         end
    #     elsif land_ids.include? intervention
    #         self.lands.each do |land|
    #             if land.id == intervention.to_i
    #                 land.area = land.area + (value.to_i * 10)
    #             end
    #         end
    #     end
    # end

    # Misc

    def length_of_hedgerows
        length = 0
        self.hedgerows.each do |hedgerow|
            length += hedgerow.length
        end
        length
    end

    def total_area
        area = 0
        self.lands.each do |land|
            area += land.area
        end
        area
    end

end


