class AddSheepBreedsToBiodiversitySurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :biodiversity_surveys, :number_of_merino, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_rambouillet, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_blue_faced_leicester, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_corridale, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_columbia, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_suffolk, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_dohne, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_poll_dorset, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_composites, :integer, default: 0
  end
end
