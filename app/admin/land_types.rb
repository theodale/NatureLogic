require 'csv'

ActiveAdmin.register LandType do

  permit_params :category, :sequestration_per_ha, :defra_uniqueness_score, :area_for_nature_rating, :above_ground_carbon_per_ha

  # Add a button to top of screen
  action_item :only => :index do
    link_to 'Upload Land Types CSV', :action => 'upload_csv'
  end

  # Collection action adds an action and generates its route.
  # This will create a route at /admin/land_types/upload_csv pointing to the Admin::LandTypesController#upload_csv action.
  collection_action :upload_csv do
    render "admin/upload_land_types"
  end

  collection_action :import_land_types_csv do

  end

end



:land_types_csv