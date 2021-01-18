class AddDefraUniquenessScoreToLandTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :land_types, :defra_uniqueness_score, :integer
  end
end
