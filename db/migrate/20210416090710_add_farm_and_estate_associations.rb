class AddFarmAndEstateAssociations < ActiveRecord::Migration[6.0]
  def change
    add_reference :farms, :estate, null: true
  end
end
