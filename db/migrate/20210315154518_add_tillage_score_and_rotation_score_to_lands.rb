class AddTillageScoreAndRotationScoreToLands < ActiveRecord::Migration[6.0]
  def change
    add_column :lands, :tillage_score, :float, default: 1.0
    add_column :lands, :rotation_score, :float, default: 1.0
  end
end
