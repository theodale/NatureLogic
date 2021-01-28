class CreateHedgerowTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :hedgerow_types do |t|
      t.string :category
      t.decimal :sequestration_per_km
      t.integer :above_ground_carbon_per_km
      t.integer :defra_uniqueness_score
      t.integer :area_for_nature_rating
      t.timestamps
    end
  end
end
