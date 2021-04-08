class CreateSchemesSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :schemes_surveys do |t|
      t.belongs_to :farm
      t.boolean :sustainable_farming_incentive, default: false
      t.boolean :local_nature_recovery, default: false
      t.boolean :landscape_recovery, default: false
      t.boolean :environmental_land_management, default: false
      t.boolean :countryside_stewardship, default: false
      t.boolean :environmental_stewardship, default: false
      t.boolean :woodland_grant, default: false
      t.boolean :organic_association, default: false
      t.boolean :soil_association, default: false
      t.boolean :pasture_fed_livestock_association, default: false
      t.boolean :sustainable_wool_standard, default: false
      t.boolean :regenerative_organic_certification, default: false
      t.boolean :conservation_projects, default: false
      t.integer :conservation_projects_number, default: 0
      t.boolean :landscape_networks, default: false
      t.integer :landscape_networks_number, default: 0
      t.timestamps
    end
  end
end
