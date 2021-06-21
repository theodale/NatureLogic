class LabBasedSoilTest < ApplicationRecord
  belongs_to :farm
  has_many :soil_parcels, dependent: :destroy

  def mean_of(value)
    if soil_parcels.size == 0
      0
    else
      values = []
      soil_parcels.each do |soil_parcel|
        values << soil_parcel.send(value)
      end
      values.sum.to_f / values.size.to_f
    end
  end

  def total_soil_carbon
    carbon_per_metre_squared = mean_of(:bulk_density) * mean_of(:SOC) * 3 / 1000
    carbon_per_metre_squared * farm.total_area * 440_000 / 12
  end

  # graph methods - remove these

  def parcel_data(name)
    data = []
    soil_parcels.each do |soil_parcel|
      data << [soil_parcel.name, soil_parcel[name]]
    end
    data
  end

  def parcel_soil_carbon_data
    data = []
    soil_parcels.each do |soil_parcel|
      data << [soil_parcel.name, (soil_parcel.SOC * soil_parcel.bulk_density)]
    end
    data
  end
end
