class AddFarmToBiodiversitySurveys < ActiveRecord::Migration[6.0]
  def change
    add_reference :biodiversity_surveys, :farm
  end
end
