class AddDefaultValuesToBiodiversitySurveys < ActiveRecord::Migration[6.0]
  def change
    change_column_default :biodiversity_surveys, :area_designated_for_natural_conservation, 0
    change_column_default :biodiversity_surveys, :area_in_existing_agri_environment_schemes, 0
    change_column_default :biodiversity_surveys, :area_of_grass_wildflower_scrub_not_for_production, 0
    change_column_default :biodiversity_surveys, :wider_countryside_description, ''
    change_column_default :biodiversity_surveys, :number_of_crop_types, 0
    change_column_default :biodiversity_surveys, :number_of_heritage_crops, 0
    change_column_default :biodiversity_surveys, :number_of_livestock_breeds, 0
    change_column_default :biodiversity_surveys, :number_of_rare_breeds, 0
    change_column_default :biodiversity_surveys, :threatened_species, false
    change_column_default :biodiversity_surveys, :threatened_species_description, ''
    change_column_default :biodiversity_surveys, :number_of_vascular_plant_species, 0
    change_column_default :biodiversity_surveys, :number_of_wild_bee_species, 0
    change_column_default :biodiversity_surveys, :number_of_farmland_bird_species, 0
    change_column_default :biodiversity_surveys, :number_of_butterfly_species, 0
    change_column_default :biodiversity_surveys, :number_of_mammal_species, 0
    change_column_default :biodiversity_surveys, :grassland_condition, ''
  end
end
