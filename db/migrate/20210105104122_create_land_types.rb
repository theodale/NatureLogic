class CreateLandTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :land_types do |t|
      t.string :category
      t.float :sequestration_per_ha, default: 0
      t.timestamps
    end
  end
end
