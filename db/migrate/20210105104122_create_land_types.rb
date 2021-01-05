class CreateLandTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :land_types do |t|
      t.string :category
      t.boolean :sprayed
      t.timestamps
    end
  end
end
