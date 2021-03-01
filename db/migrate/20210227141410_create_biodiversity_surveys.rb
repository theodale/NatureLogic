class CreateBiodiversitySurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :biodiversity_surveys do |t|
      t.integer :area_designated_for_natural_conservation, default: 0
      t.integer :area_in_existing_agri_environment_schemes, default: 0
      t.integer :area_of_grass_wildflower_scrub_not_for_production, default: 0
      t.integer :wider_countryside_description, default: 0
      t.integer :number_of_crop_types, default: 0
      t.integer :number_of_heritage_crops, default: 0
      t.integer :number_of_livestock_breeds, default: 0
      t.integer :number_of_rare_breeds, default: 0
      t.timestamps
    end
  end
end
