class AddGrasslandConditionToBiodiversitySurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :biodiversity_surveys, :grassland_condition, :string
  end
end
