class Farm < ApplicationRecord
    has_many :lands, dependent: :destroy
    has_one :target, dependent: :destroy
    accepts_nested_attributes_for :target
    accepts_nested_attributes_for :lands

    def scope_one
        emissions = self.total_diesel_use*0.25278 + self.total_gas_use*0.18387
        emissions.round(3)
    end

    def scope_two
        emissions = self.total_electricity_use*0.23314
        emissions.round(3)
    end
end
