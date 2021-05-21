class AddInitialYearToFarmTimelines < ActiveRecord::Migration[6.0]
  def change
    add_column :farm_timelines, :initial_year, :integer
  end
end
