class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.belongs_to :farm
      t.float :net_carbon_emission, default: 0
      t.float :defra_habitat_score, default: 0
      t.float :space_for_nature_score, default: 0
      t.float :countryside_stewardship_score, default: 0
      t.float :biodiversity_score, default: 0
      t.float :field_based_soil_health_score, default: 0
      t.float :lab_based_soil_health_score, default: 0
      t.float :mean_SOC, default: 0
      t.timestamps
    end
  end
end
