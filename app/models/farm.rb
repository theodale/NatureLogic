class Farm < ApplicationRecord
    has_many :lands
    has_one :target
    accepts_nested_attributes_for :target
    accepts_nested_attributes_for :lands, allow_destroy: true

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

    def woodland_sequestration
        total_sequestration = 0
        self.lands.each do |land|
            s = land.land_type.sequestration_per_ha * land.area
            total_sequestration += s
        end
        -1*total_sequestration
    end

    def net_emissions
        #farmland sequestration needed - requires lab-based soil input
        net = total_emissions + woodland_sequestration
        net.round(0)
    end

    def defra_habitat_score
        total_area = 0
        total_defra_habitat_index = 0
        self.lands.each do |land|
            total_area += land.area
            total_defra_habitat_index += land.land_type.defra_uniqueness_score * land.area
        end
        (total_defra_habitat_index / (total_area * 10)).round(1)
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

    def above_ground_carbon
        total_above_ground_carbon = 0
        self.lands.each do |land|
            total_above_ground_carbon += land.area * land.land_type.above_ground_carbon_per_ha
        end
        total_above_ground_carbon
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