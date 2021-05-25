class Land < ApplicationRecord
    belongs_to :farm
    belongs_to :land_type

    def change_area a
        self.area = a
    end

    def sequestration
        return (self.area * self.land_type.sequestration_per_ha * self.tillage_score)
    end

    def type
        return self.land_type.category
    end

end
