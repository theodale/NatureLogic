class LabBasedSoilTest < ApplicationRecord
    belongs_to :farm
    has_many :soil_parcels, dependent: :destroy

    def mean_of value
        if self.soil_parcels.size == 0
            return 0
        else
            values = []
            self.soil_parcels.each do |soil_parcel|
                values << soil_parcel.send(value)
            end
            return values.sum.to_f / values.size.to_f
        end
    end

    def total_soil_carbon
        carbon_per_metre_squared = self.mean_of(:bulk_density) * self.mean_of(:SOC) * 3/1000
        total_carbon = carbon_per_metre_squared * self.farm.total_area * 440000/12
        return total_carbon
    end

    # graph methods - remove these

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
