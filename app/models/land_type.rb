class LandType < ApplicationRecord
    def to_s
        self.category
    end
end
