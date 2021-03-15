class LabBasedSoilTest < ApplicationRecord
    belongs_to :farm
    has_many :soil_parcels, dependent: :destroy
    accepts_nested_attributes_for :soil_parcels
end
