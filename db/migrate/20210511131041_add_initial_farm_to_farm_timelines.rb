class AddInitialFarmToFarmTimelines < ActiveRecord::Migration[6.0]
  def change
    add_column :farm_timelines, :initial_farm_id, :integer
    remove_column :farm_timelines, :initial_year
  end
end
