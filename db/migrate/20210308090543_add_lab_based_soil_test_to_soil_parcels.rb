class AddLabBasedSoilTestToSoilParcels < ActiveRecord::Migration[6.0]
  def change
    add_reference :soil_parcels, :lab_based_soil_test
  end
end
