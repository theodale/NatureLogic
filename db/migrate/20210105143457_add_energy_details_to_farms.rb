class AddEnergyDetailsToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :total_diesel_use, :decimal
    add_column :farms, :total_gas_use, :decimal
    add_column :farms, :total_electricity_use, :decimal
    add_column :farms, :artificial_fertiliser_use, :decimal
    add_column :farms, :agriculture_products_spend, :decimal
    add_column :farms, :wood_and_wood_products_spend, :decimal
    add_column :farms, :pesticides_spend, :decimal
    add_column :farms, :machinery_and_equipment_spend, :decimal
    add_column :farms, :other_spend, :decimal
    add_column :farms, :number_of_sheep, :integer
    add_column :farms, :number_of_cows, :integer
  end
end
