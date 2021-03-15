class CreateSoilParcels < ActiveRecord::Migration[6.0]
  def change
    create_table :soil_parcels do |t|
      t.float :pH, default: 7
      t.float :SOC, default: 0
      t.float :bulk_density, default: 0
      t.float :soil_texture, default: 0
      t.float :total_soil_nitrogen, default: 0
      t.float :extractable_phosphorus, default: 0
      t.float :extractable_potassium, default: 0
      t.float :cation_exchange_capacity, default: 0
      t.float :extractable_micronutrients, default: 0
      t.float :active_carbon_PoXC, default: 0
      t.float :water_holding_capacity, default: 0
      t.timestamps
    end
  end
end
