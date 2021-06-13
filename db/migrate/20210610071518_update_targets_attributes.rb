class UpdateTargetsAttributes < ActiveRecord::Migration[6.0]
  def change
    remove_column :targets, :defra_habitat_score
    remove_column :targets, :space_for_nature_score
    remove_column :targets, :countryside_stewardship_score
    remove_column :targets, :biodiversity_score
    remove_column :targets, :field_based_soil_health_score
    remove_column :targets, :lab_based_soil_health_score
    add_column :targets, :nature_positive_areas, :float
    add_column :targets, :sustainable_practices, :float
    add_column :targets, :soil_health, :float
  end
end
