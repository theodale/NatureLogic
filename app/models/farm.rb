class Farm < ApplicationRecord
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

    def scope_one
        emissions = self.total_diesel_use*0.25278 + self.total_gas_use*0.18387
        emissions.round(3)
    end

    def scope_two
        emissions = self.total_electricity_use*0.23314
        emissions.round(3)
    end

    def scope_three
        emissions = self.artificial_fertiliser_use*3.6 +
        self.agriculture_products_spend*2.144 +
        self.wood_and_wood_products_spend*0.64 +
        self.pesticides_spend*0.776 +
        self.machinery_and_equipment_spend*0.56 +
        self.number_of_sheep*1003.75 +
        self.number_of_cows*4015
        emissions.round(3)
    end

    def total_emissions
        scope_one + scope_two + scope_three
    end

    def sequestration
        total_sequestration = 0
        self.lands.each do |land|
            total_sequestration += land.land_type.sequestration_per_ha * land.area
        end
        self.hedgerows.each do |hedgerow|
            total_sequestration += hedgerow.hedgerow_type.sequestration_per_km * hedgerow.length
        end
        -1 * total_sequestration
    end

    def sequestration_contributions
        contributions = {}
        self.lands.each do |land|
            category = land.land_type.category
            contributions[category] = land.sequestration
            logger.debug land.sequestration
        end
        self.hedgerows.each do |hedgerow|
            category = hedgerow.hedgerow_type.category
            contributions[category] = hedgerow.sequestration
        end
        contributions
    end

    def above_ground_carbon
        total_above_ground_carbon = 0
        self.lands.each do |land|
            total_above_ground_carbon += land.area * land.land_type.above_ground_carbon_per_ha
        end
        self.hedgerows.each do |hedgerow|
            total_above_ground_carbon+= hedgerow.hedgerow_type.above_ground_carbon_per_km * hedgerow.length
        end
        total_above_ground_carbon
    end

    def net_emissions
        #farmland sequestration needed - requires lab-based soil input
        net = total_emissions + sequestration
        net.round(0)
    end

    def defra_habitat_score
        total_area = 0
        total_defra_habitat_index = 0
        self.lands.each do |land|
            total_area += land.area
            total_defra_habitat_index += land.land_type.defra_uniqueness_score * land.area
        end
        total_defra_habitat_index = total_defra_habitat_index / 10
        self.hedgerows.each do |hedgerow|
            total_defra_habitat_index += hedgerow.hedgerow_type.defra_uniqueness_score * hedgerow.length
        end
        overall_index = total_defra_habitat_index / total_area
        overall_index.round(1)
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

    def perform_interventions(interventions)
        interventions.each do |intervention, value|
            perform_intervention(intervention, value)
        end
    end

    def perform_intervention(intervention, value)
        land_ids = []
        self.lands.each do |land|
            land_ids << land.id.to_s
        end
        if intervention == "cropland_to_woodland"
            self.number_of_sheep += value.to_i
        elsif intervention == "green_electricity_tariff"
            self.total_electricity_use = 0 if value == "true"
        elsif intervention == "reduce_diesel_use"
            self.total_diesel_use = self.total_diesel_use * value.to_f
        elsif intervention == "reduce_fertiliser_use"
            self.artificial_fertiliser_use = self.artificial_fertiliser_use * value.to_f
        elsif intervention == "go_organic"
            self.artificial_fertiliser_use = 0 if value == "true"
            self.lands.each do |land|
                land.sprayed = false if value == "true"
            end
        elsif land_ids.include? intervention
            self.lands.each do |land|
                if land.id == intervention.to_i
                    land.area = land.area + (value.to_i * 10)
                end
            end
        end
    end

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


