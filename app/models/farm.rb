class Farm < ApplicationRecord
    has_many :lands, dependent: :destroy
    has_one, :target
end
