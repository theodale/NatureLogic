class AddYearAndTimelineToFarms < ActiveRecord::Migration[6.0]
  def change
    add_reference :farms, :farm_timeline, null: true
    add_column :farms, :year, :integer
  end
end
