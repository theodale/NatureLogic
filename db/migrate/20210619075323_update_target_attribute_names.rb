class UpdateTargetAttributeNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :targets, :ecological_focus_areas, :ecological_focus_area
    rename_column :targets, :soil_health, :soil_health_score
  end
end
