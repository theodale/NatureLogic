class AddDetailsToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :name, :string
    add_column :farms, :location, :string
    add_column :farms, :latlong, :string

    add_column :farms, :latitude, :string
    add_column :farms, :longitude, :string
    add_column :farms, :farm_area, :integer
    add_column :farms, :pasture_area, :integer
    add_column :farms, :crop_area, :integer
    add_column :farms, :hedgerow_area, :integer
    add_column :farms, :woodland_area, :integer
    add_column :farms, :set_aside_1yr_area, :integer
    add_column :farms, :set_aside_1yr_to_5yr_area, :integer
    add_column :farms, :set_aside_5yr_area, :integer

    add_column :farms, :diesel_use, :integer
    add_column :farms, :gas_use, :integer
    add_column :farms, :electricity_use, :integer

    add_column :farms, :sheep, :integer
    add_column :farms, :cows, :integer

    add_column :farms, :tillage_area, :integer
    add_column :farms, :sprayage_area, :integer
    add_column :farms, :artificial_fertiliser_applied, :integer
    add_column :farms, :annual_applied_pesticide, :integer
    add_column :farms, :annual_applied_herbicide, :integer
    add_column :farms, :annual_applied_fungicide, :integer

    add_column :farms, :organic, :boolean

    add_column :farms, :machinery_spend, :integer
    add_column :farms, :labour_spend, :integer
    add_column :farms, :feed_spend, :integer
    add_column :farms, :non_fuel_spend, :integer

  end
end
