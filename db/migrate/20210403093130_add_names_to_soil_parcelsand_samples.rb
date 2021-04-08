class AddNamesToSoilParcelsandSamples < ActiveRecord::Migration[6.0]
  def change
    add_column :soil_parcels, :name, :string, default: "Unnamed Parcel"
    add_column :soil_samples, :name, :string, default: "Unnamed Sample"
  end
end
