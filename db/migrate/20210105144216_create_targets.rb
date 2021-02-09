class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.belongs_to :farm
      t.float :net_carbon_emission
      t.float :defra_habitat_score
      t.float :space_for_nature_score
      t.float :countryside_stewardship_score
      t.float :biodiversity_score
      t.float :field_based_soil_health_score
      t.float :lab_based_soil_health_score
      t.float :mean_SOC
      t.timestamps
    end
  end
end
