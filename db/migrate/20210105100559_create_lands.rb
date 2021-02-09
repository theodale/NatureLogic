class CreateLands < ActiveRecord::Migration[6.0]
  def change
    create_table :lands do |t|
      t.float :area
      t.belongs_to :farm
      t.belongs_to :land_type
      t.boolean :sprayed
      t.timestamps
    end
  end
end
