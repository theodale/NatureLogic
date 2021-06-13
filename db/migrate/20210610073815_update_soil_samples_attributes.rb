class UpdateSoilSamplesAttributes < ActiveRecord::Migration[6.0]
  def change
    remove_column :soil_samples, :soil_colour
    remove_column :soil_samples, :soil_smell
    add_column :soil_samples, :soil_colour, :string
    add_column :soil_samples, :soil_smell, :string
    add_column :soil_samples, :earthworm_count, :string
  end
end
