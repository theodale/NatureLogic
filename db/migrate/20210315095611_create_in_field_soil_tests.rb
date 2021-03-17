class CreateInFieldSoilTests < ActiveRecord::Migration[6.0]
  def change
    create_table :in_field_soil_tests do |t|
      t.belongs_to :farm
      t.timestamps
    end
  end
end
