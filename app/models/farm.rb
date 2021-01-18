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
        total_sequestration
    end

    def net_emissions
        #need to add farmland sequestration (b34 on excel MVP)
        net = total_emissions - woodland_sequestration
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
end