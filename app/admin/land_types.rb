require 'csv'

ActiveAdmin.register LandType do
  permit_params :category, :sequestration_per_ha, :defra_uniqueness_score,
                :area_for_nature_rating, :above_ground_carbon_per_ha, :meta_category

  # Add a button to top of screen
  action_item only: :index do
    link_to 'Upload Land Types CSV', action: 'upload_csv'
  end

  # Collection action adds an action and generates its route
  # This will create a route at /admin/land_types/upload_csv pointing to the Admin::LandTypesController#upload_csv action
  # By default this action will look for a view at views/admin/land_types/upload_csv.html.erb
  collection_action :upload_csv do
  end

  collection_action :import_csv, method: :post do
    land_types_csv_file = params[:land_types_csv].read
    first_row = true
    CSV.parse(land_types_csv_file) do |row|
      if first_row
        first_row = false
      else
        new_land_type = LandType.new
        new_land_type.category = row[0]
        new_land_type.sequestration_per_ha = row[1]
        new_land_type.defra_uniqueness_score = row[2]
        new_land_type.area_for_nature_rating = row[3]
        new_land_type.above_ground_carbon_per_ha = row[4]
        new_land_type.meta_category = row[5]
        new_land_type.save
      end
    end
    redirect_to action: :index, notice: 'Imported Successfully'
  end
end
