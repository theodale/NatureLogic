class Land < ApplicationRecord
    belongs_to :farm
    belongs_to :land_type

    def sequestration
        (self.area * self.land_type.sequestration_per_ha)
    end
end
