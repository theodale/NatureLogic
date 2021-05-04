class AddNameToEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :estates, :name, :string
  end
end
