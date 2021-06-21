class AddSpeciesDetailsToBiodiversitySurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :biodiversity_surveys, :threatened_species, :boolean, default: false
    add_column :biodiversity_surveys, :threatened_species_description, :string, default: 'No Description'
    add_column :biodiversity_surveys, :number_of_vascular_plant_species, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_wild_bee_species, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_farmland_bird_species, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_butterfly_species, :integer, default: 0
    add_column :biodiversity_surveys, :number_of_mammal_species, :integer, default: 0
  end
end
