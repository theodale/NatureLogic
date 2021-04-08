class UpdateLandTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :land_types, :farmland_or_woodland, :string
    add_column :land_types, :meta_category, :string, default: "Other"
  end
end


