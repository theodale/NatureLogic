class RemoveLatitudeAndLongitudeFromFarms < ActiveRecord::Migration[6.0]
  def change
    remove_column :farms, :latitude
    remove_column :farms, :longitude
  end
end
