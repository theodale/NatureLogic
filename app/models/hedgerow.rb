class Hedgerow < ApplicationRecord
    belongs_to :farm
    belongs_to :hedgerow_type

    def type
        return self.hedgerow_type.category
    end

    def sequestration
        return (self.length * self.hedgerow_type.sequestration_per_km)
    end

end
