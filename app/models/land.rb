class Land < ApplicationRecord
    belongs_to :farm
    belongs_to :land_type
end
