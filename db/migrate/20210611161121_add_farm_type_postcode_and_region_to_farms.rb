class AddFarmTypePostcodeAndRegionToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :postcode, :string
    add_column :farms, :farm_type, :string
    add_column :farms, :region, :string
  end
end
