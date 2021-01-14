class CreateLandTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :land_types do |t|
      t.string :category
      t.decimal :sequestration_per_ha
      t.timestamps
    end
  end
end
