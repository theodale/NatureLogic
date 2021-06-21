class AddFarmlandOrWoodlandToLandTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :land_types, :farmland_or_woodland, :string, default: 'Farmland'
  end
end
