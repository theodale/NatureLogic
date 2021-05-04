class AddLocationToEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :estates, :location, :string
  end
end
