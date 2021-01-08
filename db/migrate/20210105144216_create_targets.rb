class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.belongs_to :farm
      t.decimal :net_carbon_emission, limit: 100
      t.decimal :defra_habitat_score, limit: 100
      t.decimal :space_for_nature_score, limit: 100
      t.decimal :countryside_stewardship_score, limit: 100
      t.decimal :biodiversity_score, limit: 100
      t.decimal :field_based_soil_health_score, limit: 100
      t.decimal :lab_based_soil_health_score, limit: 100
      t.decimal :mean_SOC, limit: 100
      t.timestamps
    end
  end
end
