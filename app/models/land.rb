class Land < ApplicationRecord
    belongs_to :farm
    has_one :land_type
end
