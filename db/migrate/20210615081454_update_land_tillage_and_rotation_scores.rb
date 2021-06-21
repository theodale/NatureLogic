class UpdateLandTillageAndRotationScores < ActiveRecord::Migration[6.0]
  def change
    remove_column :lands, :tillage_score
    remove_column :lands, :rotation_score
    add_column :lands, :rotation_practice, :string, default: ''
    add_column :lands, :tillage_method, :string, default: ''
  end
end
