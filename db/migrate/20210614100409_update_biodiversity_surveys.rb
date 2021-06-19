class UpdateBiodiversitySurveys < ActiveRecord::Migration[6.0]
  def change
    remove_column :biodiversity_surveys, :area_designated_for_natural_conservation
    remove_column :biodiversity_surveys, :area_in_existing_agri_environment_schemes
    remove_column :biodiversity_surveys, :area_of_grass_wildflower_scrub_not_for_production
    remove_column :biodiversity_surveys, :wider_countryside_description
    remove_column :biodiversity_surveys, :number_of_crop_types
    remove_column :biodiversity_surveys, :number_of_heritage_crops
    remove_column :biodiversity_surveys, :number_of_livestock_breeds
    remove_column :biodiversity_surveys, :number_of_rare_breeds
    remove_column :biodiversity_surveys, :threatened_species
    remove_column :biodiversity_surveys, :threatened_species_description
    remove_column :biodiversity_surveys, :number_of_vascular_plant_species
    remove_column :biodiversity_surveys, :number_of_wild_bee_species
    remove_column :biodiversity_surveys, :number_of_farmland_bird_species
    remove_column :biodiversity_surveys, :number_of_butterfly_species
    remove_column :biodiversity_surveys, :number_of_mammal_species
    add_column :biodiversity_surveys, :area_designated_for_natural_conservation, :float
    add_column :biodiversity_surveys, :area_in_existing_agri_environment_schemes, :float
    add_column :biodiversity_surveys, :area_of_grass_wildflower_scrub_not_for_production, :float
    add_column :biodiversity_surveys, :wider_countryside_description, :string
    add_column :biodiversity_surveys, :number_of_crop_types, :integer
    add_column :biodiversity_surveys, :number_of_heritage_crops, :integer
    add_column :biodiversity_surveys, :number_of_livestock_breeds, :integer
    add_column :biodiversity_surveys, :number_of_rare_breeds, :integer
    add_column :biodiversity_surveys, :threatened_species, :boolean
    add_column :biodiversity_surveys, :threatened_species_description, :string
    add_column :biodiversity_surveys, :number_of_vascular_plant_species, :integer
    add_column :biodiversity_surveys, :number_of_wild_bee_species, :integer
    add_column :biodiversity_surveys, :number_of_farmland_bird_species, :integer
    add_column :biodiversity_surveys, :number_of_butterfly_species, :integer
    add_column :biodiversity_surveys, :number_of_mammal_species, :integer
  end
end

