class AddEstateIdToFarmTimelines < ActiveRecord::Migration[6.0]
  def change
    add_reference :farm_timelines, :estate, null: true
  end
end
