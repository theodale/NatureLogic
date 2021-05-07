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
            return (parcels_soc.sum(0.0) / parcels_soc.size).round(2)
        else
            return 0
        end
    end

    def average_bulk_density
        bulk_densities = []
        self.soil_parcels.each do |soil_parcel|
            bulk_densities << soil_parcel.bulk_density
        end
        if bulk_densities.size != 0
            return average_bulk_density = bulk_densities.sum(0.0) / bulk_densities.size
        else
            return 0
        end
    end

    def total_carbon_in_terms_of_CO2e
        carbon_per_metre_squared = average_bulk_density * mean_SOC * 0.3
        return (carbon_per_metre_squared * 3.6667 * 10000 * self.farm.total_area).round(1)
    end

    # Need last years SOC value (set to mean_SOC * )
    def total_carbon_in_terms_of_CO2e_last_year
       carbon_per_metre_squared = average_bulk_density * mean_SOC * 0.99999 * 0.3
       return (carbon_per_metre_squared * 3.6667 * 10000 * self.farm.total_area).round(1)
    end

    # graph methods

    def parcel_data name
        data = []
        self.soil_parcels.each do |soil_parcel|
            data << [soil_parcel.name, soil_parcel[name]]
        end
        return data
    end

    def parcel_soil_carbon_data
        data = []
        self.soil_parcels.each do |soil_parcel|
            data << [soil_parcel.name, (soil_parcel.SOC * soil_parcel.bulk_density)]
        end
        return data
    end

end
