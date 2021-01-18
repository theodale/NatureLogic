class AddAreaForNatureRatingToLandTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :land_types, :area_for_nature_rating, :integer
  end
end
