class Estate < ApplicationRecord
    has_many :farms
    belongs_to :estate_user
end
