class CreateFarmTimelines < ActiveRecord::Migration[6.0]
  def change
    create_table :farm_timelines do |t|
      t.timestamps
    end
  end
end
