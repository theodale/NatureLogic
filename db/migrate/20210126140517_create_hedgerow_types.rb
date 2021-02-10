class CreateHedgerowTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :hedgerow_types do |t|
      t.string :category
      t.decimal :sequestration_per_km, default: 0
      t.integer :above_ground_carbon_per_km, default: 0
      t.integer :defra_uniqueness_score, default: 0
      t.integer :area_for_nature_rating, default: 0
      t.timestamps
    end
  end
end
