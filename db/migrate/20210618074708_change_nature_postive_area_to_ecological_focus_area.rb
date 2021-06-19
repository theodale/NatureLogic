class ChangeNaturePostiveAreaToEcologicalFocusArea < ActiveRecord::Migration[6.0]
  def change
    rename_column :targets, :nature_positive_areas, :ecological_focus_areas
  end
end
