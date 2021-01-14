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

    def land_sequestration
        total_sequestration = 0
        self.lands.each do |land|
            s = land.land_type.sequestration_per_ha * land.area
            total_sequestration += s
        end
        total_sequestration
    end

    def

    end
end