class RemoveDefaultValuesFromTargetAttributes < ActiveRecord::Migration[6.0]
  def change
    remove_column :targets, :mean_SOC
    add_column :targets, :mean_SOC, :float
    remove_column :targets, :net_carbon_emission
    add_column :targets, :net_carbon_emission, :float
  end
end
