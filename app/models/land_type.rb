class LandType < ApplicationRecord

    def to_s
        return self.category
    end

end
