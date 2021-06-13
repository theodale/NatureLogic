class AddCarbonPriceToEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :estates, :carbon_price, :float
  end
end

