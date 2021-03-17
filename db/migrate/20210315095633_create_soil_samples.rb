class CreateSoilSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :soil_samples do |t|
      t.belongs_to :in_field_soil_test
      t.integer :compaction, default: 0
      t.integer :diversity_of_macro_life, default: 0
      t.integer :crusting, default: 0
      t.integer :ground_cover, default: 0
      t.integer :ponding, default: 0
      t.integer :plant_health, default: 0
      t.integer :root_growth, default: 0
      t.integer :aggregate_stability, default: 0
      t.integer :soil_colour, default: 0
      t.integer :soil_smell, default: 0
      t.timestamps
    end
  end
end
