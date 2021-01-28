class Farm < ApplicationRecord
    has_many :lands
    has_many :hedgerows
    has_one :target
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
        # self.hedgerows.each do |hedgerow|
        #     total_defra_habitat_index += hedgerow.hedgerow_type.defra_uniqueness_score * hedgerow.length
        # end
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


    #interventions


    def perform_interventions(interventions)
        interventions.each do |intervention, value|
            perform_intervention(intervention, value)
        end
    end


    def perform_intervention(intervention, value)
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
        end
    end

    def land_info
        l = []
        self.lands.each do |land|
            l << land.land_type.category
            l << land.area
            l << land.sprayed
        end
        l
    end

    def to_woodland(land_type)
        woodland_id = LandType.find_by(category: "Juvenile Woodland - Mixed Deciduous").id
        land_id = LandType.find_by(category: land_type).id
        woodland = self.lands.find_by(land_type_id: woodland_id)
        land = self.lands.find_by(land_type_id: land_id)
        woodland.area += 10
        land.area -= 10
        woodland.save
        land.save
    end

    def reduce_usage(substance)
        if substance == "Diesel"
            self.total_diesel_use = self.total_diesel_use * 0.8
        elsif substance == "Fertiliser"
            self.artificial_fertiliser_use = self.artificial_fertiliser_use * 0.8
        end
        self.save
    end

    def go_organic(direction)
        if direction == "forward"
            self.lands.each do |land|
                land.sprayed = false
                land.save
            end
        end
    end

    def fertiliser_to_manure(direction)
        if direction == "forward"
            self.artificial_fertiliser_use = 0
            self.save
        end
    end

end


