class CreateLabBasedSoilTests < ActiveRecord::Migration[6.0]
  def change
    create_table :lab_based_soil_tests do |t|
      t.belongs_to :farm
      t.timestamps
    end
  end
end
