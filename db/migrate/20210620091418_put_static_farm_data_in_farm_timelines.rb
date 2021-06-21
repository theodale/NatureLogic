class PutStaticFarmDataInFarmTimelines < ActiveRecord::Migration[6.0]
  def change
    remove_column :farms, :name
    remove_column :farms, :location
    remove_column :farms, :farm_type
    remove_column :farms, :postcode
    remove_column :farms, :region
    add_column :farm_timelines, :name, :string
    add_column :farm_timelines, :location, :string
    add_column :farm_timelines, :farm_type, :string
    add_column :farm_timelines, :postcode, :string
    add_column :farm_timelines, :region, :string
    remove_column :farm_timelines, :initial_farm_id
  end
end



