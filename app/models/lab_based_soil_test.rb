class LabBasedSoilTest < ApplicationRecord
    belongs_to :farm
    has_many :soil_parcels, dependent: :destroy
    accepts_nested_attributes_for :soil_parcels

    def mean_SOC
        parcels_soc = []
        self.soil_parcels.each do |soil_parcel|
            parcels_soc << soil_parcel.SOC
        end
        if parcels_soc.size != 0
            return parcels_soc.sum(0.0) / parcels_soc.size
        else
            return 0
        end
    end

    def total_c
        bulk_densities = []
        self.soil_parcels.each do |soil_parcel|
            bulk_densities << soil_parcel.bulk_density
        end
        if bulk_densities.size != 0
            average_bulk_density = bulk_densities.sum(0.0) / bulk_densities.size
            mean_soc = mean_SOC
            carbon_per_metre_squared = average_bulk_density * mean_soc * 300
            return (carbon_per_metre_squared * 3.6667 * 10000 * self.farm.total_area).round(0)
        else
            return 0
        end
    end

end
