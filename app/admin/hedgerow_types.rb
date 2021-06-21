require 'csv'

ActiveAdmin.register HedgerowType do
  permit_params :category, :sequestration_per_ha, :defra_uniqueness_score, :area_for_nature_rating,
                :above_ground_carbon_per_ha

  action_item only: :index do
    link_to 'Upload Hedgerow Types CSV', action: 'upload_csv'
  end

  collection_action :upload_csv do
  end

  collection_action :import_csv, method: :post do
    hedgerow_types_csv_file = params[:hedgerow_types_csv].read
    first_row = true
    CSV.parse(hedgerow_types_csv_file) do |row|
      if first_row
        first_row = false
      else
        new_hedgerow_type = HedgerowType.new
        new_hedgerow_type.category = row[0]
        new_hedgerow_type.sequestration_per_km = row[1]
        new_hedgerow_type.defra_uniqueness_score = row[2]
        new_hedgerow_type.area_for_nature_rating = row[3]
        new_hedgerow_type.above_ground_carbon_per_km = row[4]
        new_hedgerow_type.save
      end
    end
    redirect_to action: :index, notice: 'Imported Successfully'
  end
end
