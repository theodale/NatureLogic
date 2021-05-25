class AddIncreasedToLabBasedSoilTests < ActiveRecord::Migration[6.0]
  def change
    add_column :lab_based_soil_tests, :increased, :boolean, default: false
  end
end
