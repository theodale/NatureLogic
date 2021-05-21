class ReconfigureFarmTimeline < ActiveRecord::Migration[6.0]
  def change
    add_reference :farm_timelines, :farm_user, null: true
    remove_column :farms, :estate_id
    remove_column :farms, :farm_user_id
  end
end
