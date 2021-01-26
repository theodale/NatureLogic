class AddAboveGroundCarbonPerHectareToLandTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :land_types, :above_ground_carbon_per_ha, :integer
  end
end
