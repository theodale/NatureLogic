class Target < ApplicationRecord
  belongs_to :farm, optional: true
  belongs_to :estate, optional: true
end
