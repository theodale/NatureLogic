class Hedgerow < ApplicationRecord

    belongs_to :farm
    belongs_to :hedgerow_type

    def sequestration
        return (self.length * self.hedgerow_type.sequestration_per_km)
    end

end
