class AddInterventionToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :intervention, :boolean
  end
end
